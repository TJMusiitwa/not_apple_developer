import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:not_apple_developer/pages/browse_sub_pages/news_details.dart';
import 'package:xml/xml.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final _client = RetryClient(http.Client());
  late Future<List<XmlElement>> _feed = _loadFeed();

  Future<List<XmlElement>> _loadFeed() async {
    final response = await _client.get(
      Uri.parse('https://developer.apple.com/news/rss/news.rss'),
    );
    if (response.statusCode != 200) throw Exception('News request failed');
    return XmlDocument.parse(response.body).findAllElements('item').toList();
  }

  @override
  void dispose() {
    _client.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('News'),
            previousPageTitle: 'Browse',
          ),
          FutureBuilder<List<XmlElement>>(
            future: _feed,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: CupertinoActivityIndicator()),
                );
              }
              if (snapshot.hasError) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Unable to load news.'),
                        CupertinoButton(
                          onPressed: () => setState(() => _feed = _loadFeed()),
                          child: const Text('Try Again'),
                        ),
                      ],
                    ),
                  ),
                );
              }
              final items = snapshot.data ?? [];
              if (items.isEmpty) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: Text('No news available.')),
                );
              }
              return SliverSafeArea(
                top: false,
                sliver: SliverList.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final title = item.getElement('title')?.innerText ?? '';
                    return CupertinoListTile(
                      title: Text(title),
                      subtitle: Text(
                        item.getElement('pubDate')?.innerText ?? '',
                      ),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => NewsDetails(
                            newsTitle: title,
                            feedDescription:
                                item.getElement('description')?.innerText ?? '',
                            feedLink: item.getElement('link')?.innerText ?? '',
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
