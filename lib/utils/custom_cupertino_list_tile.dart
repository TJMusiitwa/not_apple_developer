import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class CustomCupertinoListTile extends StatelessWidget {
  const CustomCupertinoListTile({
    super.key,
    required this.leadingImage,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String leadingImage;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 90,
      ),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10, end: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                  //height: 150,
                  child: CachedNetworkImage(
                    imageUrl: leadingImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navTitleTextStyle,
                    ),
                  ],
                ),
              ),
              Icon(
                CupertinoIcons.right_chevron,
                color: CupertinoColors.systemGrey2.resolveFrom(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
