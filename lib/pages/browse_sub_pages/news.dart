import 'dart:io';

import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:not_apple_developer/pages/browse_sub_pages/news_details.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late RssFeed newsFeed;
  final client = RetryClient(http.Client());

  Future<RssFeed> getAppleNewsFeed() async {
    try {
      return await client
          .get(Uri.parse('https://developer.apple.com/news/rss/news.rss'))
          .then((response) {
        newsFeed = RssFeed.parse(response.body);
        return newsFeed;
      });
    } on HttpException catch (e) {
      throw Exception(e.message);
    }
    //throw Exception('Failed to load rss feed');
  }

  @override
  void initState() {
    super.initState();
    client;
    getAppleNewsFeed();
  }

  @override
  void dispose() {
    client.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAppleNewsFeed(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return CupertinoPageScaffold(
            child: CustomScrollView(
              slivers: <Widget>[
                const CupertinoSliverNavigationBar(
                  largeTitle: Text('News'),
                  previousPageTitle: 'Browse',
                ),
                SliverSafeArea(
                  top: false,
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      ((context, index) {
                        var newsItem = newsFeed.items[index];
                        return CupertinoListTile(
                          title: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.8),
                            child: Text(
                              newsItem.title!,
                              softWrap: true,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          trailing: const CupertinoListTileChevron(),
                          subtitle: Text(newsItem.pubDate!),
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => NewsDetails(
                                      newsTitle: newsItem.title!,
                                      feedDescription: newsItem.description!,
                                      feedLink: newsItem.link!))),
                        );
                      }),
                      childCount: newsFeed.items.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const CupertinoPageScaffold(
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      },
    );
  }
}
