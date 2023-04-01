//import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Material;
import 'package:not_apple_developer/models/details.dart';
import 'package:share_plus/share_plus.dart';
//import 'package:video_player/video_player.dart';

class VideoDetailsPage extends StatefulWidget {
  const VideoDetailsPage({Key? key, required this.detailsIdentifier})
      : super(key: key);

  final String detailsIdentifier;

  @override
  State<VideoDetailsPage> createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  int _detailView = 0;
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
  void initState() {
    super.initState();
    getDetailsData();
  }

  @override
  void dispose() {
    //vidPlayerFunction(details).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Details>(
      future: getDetailsData(),
      builder: (BuildContext context, AsyncSnapshot<Details> snapshot) {
        if (snapshot.hasData) {
          var details = snapshot.data!;
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              automaticallyImplyLeading: true,
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(CupertinoIcons.search),
                  const SizedBox(width: 30),
                  const Icon(CupertinoIcons.bookmark),
                  const SizedBox(width: 30),
                  GestureDetector(
                    child: const Icon(CupertinoIcons.share),
                    onTap: () => Share.share(
                        'Hey you should check out this Apple Developer talk video on the title "${details.videoTitle}".\n\nCheck it out at this link${details.videoParentLinkHref}'),
                  ),
                ],
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                //controller: controller,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      child: Material(
                        color: CupertinoColors.systemBackground
                            .resolveFrom(context),
                        child: const ColoredBox(color: CupertinoColors.activeOrange),
                        // Chewie(
                        //   controller: chewieController(details),
                        // ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 2),
                      child: CupertinoSlidingSegmentedControl(
                          children: const {
                            0: Text('Overview'),
                            1: Text('Transcript'),
                          },
                          groupValue: _detailView,
                          onValueChanged: (int? value) =>
                              setState(() => _detailView = value as int)),
                    ),
                    const SizedBox(height: 15),
                    _detailView == 0
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
                            style:
                                CupertinoTheme.of(context).textTheme.textStyle,
                            //textAlign: TextAlign.justify,
                            textWidthBasis: TextWidthBasis.parent,
                            softWrap: true,
                          )
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
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }
}
