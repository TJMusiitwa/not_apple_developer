import 'package:flutter/cupertino.dart';

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
            child: Center(
              child: Text('Downloaded'),
            ),
          ),
        ],
      ),
    );
  }
}
