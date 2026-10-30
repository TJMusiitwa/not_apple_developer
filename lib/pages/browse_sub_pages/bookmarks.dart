import 'package:cupertino_ui/cupertino_ui.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

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
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.bookmark,
                    size: 40,
                    color: CupertinoColors.systemGrey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Saved items will appear here.',
                    style: TextStyle(color: CupertinoColors.secondaryLabel),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
