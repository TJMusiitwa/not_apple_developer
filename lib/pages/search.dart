import 'package:flutter/cupertino.dart';
import 'package:not_apple_developer/models/video.dart';
import 'package:not_apple_developer/utils/custom_cupertino_list_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  String terms = '';
  List<Video> videos = [];

  Future<List<Video>> getVideoData() async {
    var videoData = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/videos_json.json');
    videos = videoFromJson(videoData);
    return videos;
  }

  //Search videos
  List<Video> searchVideos(String terms) {
    return videos
        .where(
          (v) =>
              v.videoTitle.toLowerCase().contains(terms.toLowerCase()) ||
              v.collection.toLowerCase().contains(terms.toLowerCase()),
        )
        .toList();
  }

  Widget _buildSearchResults(List<Video> videos) {
    if (videos.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'No content matching your search terms were found.',
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          ),
        ),
      );
    } else if (controller.text.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Enter a term to search for...',
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          ),
        ),
      );
    }

    return CupertinoScrollbar(
      child: ListView.builder(
        itemCount: videos.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          var video = videos[index];
          return CustomCupertinoListTile(
            leadingImage: video.videoThumbnail,
            title: video.collection,
            subtitle: video.videoTitle,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              controller: controller,
              focusNode: focusNode,
              padding: const EdgeInsets.all(8),
              placeholder: 'Videos,Articles,News',
              style: CupertinoTheme.of(context).textTheme.textStyle,
              onSubmitted: (value) {
                debugPrint(value);
              },
            ),
          ),
          Expanded(child: _buildSearchResults(searchVideos(terms))),
        ],
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getVideoData();
    controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      terms = controller.text;
    });
  }
}
