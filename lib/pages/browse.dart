import 'package:flutter/cupertino.dart';
import 'package:not_apple_developer/pages/browse_sub_pages/bookmarks.dart';
import 'package:not_apple_developer/pages/browse_sub_pages/downloaded.dart';
import 'package:not_apple_developer/pages/browse_sub_pages/news.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Browse'),
            ),
          ];
        },
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CupertinoListTile.notched(
                  leading: const Icon(CupertinoIcons.news),
                  title: const Text('News'),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const NewsPage())),
                ),
                CupertinoListTile.notched(
                  leading: const Icon(CupertinoIcons.bookmark),
                  title: const Text('Bookmarks'),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const BookmarksPage())),
                ),
                CupertinoListTile.notched(
                  leading: const Icon(CupertinoIcons.arrow_down_circle),
                  title: const Text('Downloaded'),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const DownloadedPage())),
                ),
                CupertinoListSection(
                  header: Text(
                    'Topics',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .pickerTextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor:
                      CupertinoTheme.of(context).scaffoldBackgroundColor,
                  children: const [
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.person_2_fill),
                      title: Text('Accessibility & Inclusion'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.gear_solid),
                      title: Text('App Services'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.tv_music_note_fill),
                      title: Text('Audio & Video'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.viewfinder),
                      title: Text('Augmented Reality'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.chart_bar_fill),
                      title: Text('App Store Distribution & Marketing'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.briefcase_fill),
                      title: Text('Business & Education'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.paintbrush_fill),
                      title: Text('Design'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.hammer_fill),
                      title: Text('Developer Tools'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.cube_fill),
                      title: Text('Essentials'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.gamecontroller_fill),
                      title: Text('Graphics & Games'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.heart_fill),
                      title: Text('Health & Fitness'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.map_fill),
                      title: Text('Maps & Location'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.eye_fill),
                      title: Text('ML & Vision'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.camera_fill),
                      title: Text('Photos & Camera'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.hand_raised_fill),
                      title: Text('Privacy & Security'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.doc_fill),
                      title: Text('Special Events'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.compass_fill),
                      title: Text('Safari & Web'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.flag_slash),
                      title: Text('Swift'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.slider_horizontal_3),
                      title: Text('SwiftUI & UI Frameworks'),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile.notched(
                      leading: Icon(CupertinoIcons.globe),
                      title: Text('System Services'),
                      trailing: CupertinoListTileChevron(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
