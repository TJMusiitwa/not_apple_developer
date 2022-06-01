import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:not_apple_developer/pages/account.dart';
import 'package:not_apple_developer/pages/browse.dart';
import 'package:not_apple_developer/pages/discover.dart';
import 'package:not_apple_developer/pages/search.dart';
import 'package:not_apple_developer/pages/wwdc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'NotAppleDev',
      theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.activeBlue,
          textTheme: CupertinoTextThemeData()),
      onGenerateRoute: (settings) => MaterialWithModalsPageRoute(
        builder: (context) => CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
                backgroundColor: CupertinoTheme.of(context)
                    .barBackgroundColor
                    .withOpacity(0.9),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.compass_fill),
                      label: 'Discover'),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.collections_solid),
                      label: 'Browse'),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.suit_club_fill), label: 'WWDC'),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.person_circle_fill),
                      label: 'Account'),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.search), label: 'Search'),
                ]),
            tabBuilder: (context, index) {
              late CupertinoTabView tabView;
              switch (index) {
                case 0:
                  tabView = CupertinoTabView(
                      builder: (context) =>
                          const CupertinoPageScaffold(child: DiscoverPage()));
                  break;
                case 1:
                  tabView = CupertinoTabView(
                      builder: (context) =>
                          const CupertinoPageScaffold(child: BrowsePage()));
                  break;
                case 2:
                  tabView = CupertinoTabView(
                      builder: (context) => const CupertinoPageScaffold(
                            backgroundColor: CupertinoColors.black,
                            child: WWDCPage(),
                          ));
                  break;
                case 3:
                  tabView = CupertinoTabView(
                    builder: (context) =>
                        const CupertinoPageScaffold(child: AccountPage()),
                  );
                  break;
                case 4:
                  tabView = CupertinoTabView(
                    builder: (context) => const CupertinoPageScaffold(
                        navigationBar: CupertinoNavigationBar(
                          automaticallyImplyLeading: false,
                          middle: Text('Search'),
                        ),
                        child: SearchPage()),
                  );
              }
              return tabView;
            }),
      ),
    );
  }
}
