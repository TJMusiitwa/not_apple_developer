import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:not_apple_developer/models/discover.dart';
import 'package:not_apple_developer/pages/video_details_page.dart';
import 'package:not_apple_developer/utils/custom_cupertino_list_tile.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  Future<List<Discover>>? _discover;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _discover ??= DefaultAssetBundle.of(context)
        .loadString('assets/discover.json')
        .then(discoverFromJson);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CupertinoSliverNavigationBar(largeTitle: Text('Discover')),
        SliverToBoxAdapter(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: 1.55,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset('assets/wwdc22.jpg', fit: BoxFit.cover),
                            const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0x00000000),
                                    Color(0xCC000000),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              right: 20,
                              bottom: 20,
                              child: Text(
                                'Swiftly approaching.',
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .navLargeTitleTextStyle
                                    .copyWith(
                                      color: CupertinoColors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder<List<Discover>>(
                    future: _discover,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const Padding(
                          padding: EdgeInsets.all(32),
                          child: Center(child: CupertinoActivityIndicator()),
                        );
                      }
                      if (snapshot.hasError) {
                        return const Padding(
                          padding: EdgeInsets.all(24),
                          child: Text('Unable to load Discover content.'),
                        );
                      }
                      final items = snapshot.data ?? [];
                      if (items.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(24),
                          child: Text('No discover data'),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < items.length; i++) ...[
                            if (i == 0 ||
                                items[i].sectionTitle !=
                                    items[i - 1].sectionTitle)
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  20,
                                  28,
                                  20,
                                  8,
                                ),
                                child: Text(
                                  items[i].sectionTitle,
                                  style: CupertinoTheme.of(context)
                                      .textTheme
                                      .navTitleTextStyle
                                      .copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            CustomCupertinoListTile(
                              title: items[i].discoverCollection,
                              subtitle: items[i].discoverTitle,
                              leadingImage: items[i].discoverImage,
                              onTap: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => VideoDetailsPage(
                                    detailsIdentifier: items[i].discoverTitle,
                                  ),
                                ),
                              ),
                            ),
                            if (i + 1 < items.length &&
                                items[i].sectionTitle ==
                                    items[i + 1].sectionTitle)
                              Padding(
                                padding: const EdgeInsets.only(left: 160),
                                child: Container(
                                  height:
                                      1 /
                                      MediaQuery.devicePixelRatioOf(context),
                                  color: CupertinoColors.separator.resolveFrom(
                                    context,
                                  ),
                                ),
                              ),
                          ],
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
