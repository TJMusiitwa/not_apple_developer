//import 'package:chewie/chewie.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:not_apple_developer/models/details.dart';
import 'package:share_plus/share_plus.dart';

//import 'package:video_player/video_player.dart';

class VideoDetailsPage extends StatefulWidget {
  const VideoDetailsPage({super.key, required this.detailsIdentifier});

  final String detailsIdentifier;

  @override
  State<VideoDetailsPage> createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  int _detailView = 0;
  Future<Details>? _details;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _details ??= getDetailsData();
  }

  Future<Details> getDetailsData() async {
    var detailsData = await DefaultAssetBundle.of(context)
        .loadString('assets/apple_video_details.json');
    return detailsFromJson(detailsData)
        .where((data) => data.videoTitle == widget.detailsIdentifier)
        .single;
  }

  // VideoPlayerController vidPlayerFunction(Details details) {
  //   return VideoPlayerController.network(details.hdVideoSrc!);
  // }

  // ChewieController chewieController(Details details) {
  //   return ChewieController(
  //     videoPlayerController: vidPlayerFunction(details),
  //     aspectRatio: 16 / 9,
  //     autoPlay: false,
  //     looping: false,
  //     showControls: true,
  //     autoInitialize: true,
  //     allowFullScreen: true,
  //     allowMuting: true,
  //     deviceOrientationsOnEnterFullScreen: [
  //       DeviceOrientation.landscapeLeft,
  //       DeviceOrientation.landscapeRight,
  //     ],
  //     deviceOrientationsAfterFullScreen: [
  //       DeviceOrientation.portraitDown,
  //       DeviceOrientation.portraitUp,
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Details>(
      future: _details,
      builder: (BuildContext context, AsyncSnapshot<Details> snapshot) {
        if (snapshot.hasData) {
          var details = snapshot.data!;
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              automaticallyImplyLeading: true,
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: const Icon(CupertinoIcons.share),
                    onTap: () => SharePlus.instance.share(
                      ShareParams(
                        text:
                            'Hey you should check out this Apple Developer talk video on the title "${details.videoTitle}".\n\nCheck it out at this link${details.videoParentLinkHref}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                //controller: controller,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ColoredBox(
                        color: CupertinoColors.secondarySystemBackground
                            .resolveFrom(context),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                CupertinoIcons.play_rectangle,
                                size: 40,
                                color: CupertinoColors.secondaryLabel
                                    .resolveFrom(context),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Video playback is unavailable',
                                style: TextStyle(
                                  color: CupertinoColors.secondaryLabel
                                      .resolveFrom(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 360),
                      child: CupertinoSlidingSegmentedControl(
                        children: const {
                          0: Text('Overview'),
                          1: Text('Transcript'),
                        },
                        groupValue: _detailView,
                        onValueChanged: (int? value) {
                          if (value != null) {
                            setState(() => _detailView = value);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                      child: _detailView == 0
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  details.videoTitle,
                                  style: CupertinoTheme.of(context)
                                      .textTheme
                                      .dateTimePickerTextStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  details.videoDescription,
                                  style: CupertinoTheme.of(context)
                                      .textTheme
                                      .textStyle,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Resources',
                                  style: CupertinoTheme.of(context)
                                      .textTheme
                                      .dateTimePickerTextStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          : Text(
                              details.videoTranscript ?? 'No video transcript',
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .textStyle,
                              //textAlign: TextAlign.justify,
                              textWidthBasis: TextWidthBasis.parent,
                              softWrap: true,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'An error occurred while loading the video details.',
                style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
              ),
            ),
          );
        } else {
          return const Center(child: CupertinoActivityIndicator());
        }
      },
    );
  }
}
