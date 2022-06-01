import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails(
      {Key? key,
      required this.feedDescription,
      required this.feedLink,
      required this.newsTitle})
      : super(key: key);

  final String newsTitle;
  final String feedDescription;
  final String feedLink;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: 'News',
          trailing: GestureDetector(
              onTap: () {
                Share.share(
                    'Check out this article: $newsTitle\n\n$feedDescription\n\n$feedLink',
                    subject:
                        'Check out this article from Apple Developer News');
              },
              child: const Icon(CupertinoIcons.share)),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    newsTitle,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navTitleTextStyle
                        .copyWith(fontSize: 23),
                  ),
                ),
                Html(
                  data: feedDescription,
                  style: {
                    'p': Style.fromTextStyle(
                        CupertinoTheme.of(context).textTheme.textStyle),
                    'h3': Style.fromTextStyle(CupertinoTheme.of(context)
                        .textTheme
                        .navTitleTextStyle
                        .copyWith(fontSize: 23)),
                    'a': Style.fromTextStyle(
                        CupertinoTheme.of(context).textTheme.actionTextStyle),
                    'li': Style.fromTextStyle(
                        CupertinoTheme.of(context).textTheme.textStyle)
                  },
                  onLinkTap: (url, context, _, __) => launchUrl(
                    Uri.parse(url!),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
