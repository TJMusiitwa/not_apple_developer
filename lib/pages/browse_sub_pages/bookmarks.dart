import 'package:flutter/cupertino.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Bookmarks'),
            previousPageTitle: 'Browse',
          ),
          SliverFillRemaining(
            child: Center(
              child: Text('Bookmarks'),
            ),
          ),
        ],
      ),
    );
  }
}
