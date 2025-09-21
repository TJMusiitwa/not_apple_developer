import 'package:flutter/cupertino.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:not_apple_developer/models/discover.dart';
import 'package:not_apple_developer/pages/video_details_page.dart';
import 'package:not_apple_developer/utils/custom_cupertino_list_tile.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    //final ScrollController scrollController = ScrollController();
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          const CupertinoSliverNavigationBar(largeTitle: Text('Discover')),
        ];
      },
      body: SafeArea(
        top: false,
        child: CupertinoScrollbar(
          //controller: scrollController,
          child: SingleChildScrollView(
            //controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/wwdc22.jpg',
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                    Positioned(
                      left: 5,
                      bottom: 5,
                      right: 0,
                      child: Text(
                        'Swiftly approaching.',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .pickerTextStyle
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: CupertinoColors.white,
                            ),
                      ),
                    ),
                  ],
                ),
                greatDeveloperHabits(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Discover>> getDiscoverData() async {
    var discoverData = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/discover.json');
    return discoverFromJson(discoverData);
  }

  FutureBuilder<List<Discover>> greatDeveloperHabits() {
    return FutureBuilder(
      future: getDiscoverData(),
      builder: (BuildContext context, AsyncSnapshot<List<Discover>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            snapshot.data != null) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (snapshot.hasError) {
          debugPrint(snapshot.error.toString());
        }

        if (snapshot.hasData == false) {
          return const Center(child: Text('No data'));
        }
        return snapshot.data!.isNotEmpty
            ? GroupedListView<Discover, String>(
                elements: snapshot.data!,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                groupBy: (discover) => discover.sectionTitle,
                groupHeaderBuilder: (discover) => Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 20),
                  child: Text(
                    discover.sectionTitle,
                    style: CupertinoTheme.of(context).textTheme.pickerTextStyle
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                sort: false,
                //useStickyGroupSeparators: true,
                stickyHeaderBackgroundColor: CupertinoColors
                    .secondarySystemGroupedBackground
                    .resolveFrom(context),
                itemComparator: (discover1, discover2) =>
                    discover1.sectionTitle.compareTo(discover2.sectionTitle),
                indexedItemBuilder: (context, discover, index) {
                  var item = snapshot.data![index];
                  return CustomCupertinoListTile(
                    title: item.discoverCollection,
                    subtitle: item.discoverTitle,
                    leadingImage: item.discoverImage,
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => VideoDetailsPage(
                          detailsIdentifier: item.discoverTitle,
                        ),
                      ),
                    ),
                  );
                },
                separator: Container(
                  margin: const EdgeInsetsDirectional.only(start: 40),
                  color: CupertinoColors.separator.resolveFrom(context),
                  height: 1.0 / MediaQuery.of(context).devicePixelRatio,
                ),
              )
            : Center(
                child: Text(
                  'No discover data',
                  softWrap: true,
                  style: CupertinoTheme.of(
                    context,
                  ).textTheme.textStyle.copyWith(fontSize: 25),
                ),
              );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getDiscoverData();
  }
}
