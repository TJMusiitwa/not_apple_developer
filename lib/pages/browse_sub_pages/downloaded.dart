import 'package:cupertino_ui/cupertino_ui.dart';

class DownloadedPage extends StatelessWidget {
  const DownloadedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Downloaded'),
            previousPageTitle: 'Browse',
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.arrow_down_circle,
                    size: 40,
                    color: CupertinoColors.systemGrey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Downloaded videos will appear here.',
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
