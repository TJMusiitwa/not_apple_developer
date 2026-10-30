import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

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
    final content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 128,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(
                  imageUrl: leadingImage,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => ColoredBox(
                    color: CupertinoColors.tertiarySystemFill.resolveFrom(
                      context,
                    ),
                  ),
                  errorWidget: (_, _, _) => ColoredBox(
                    color: CupertinoColors.tertiarySystemFill.resolveFrom(
                      context,
                    ),
                    child: const Icon(
                      CupertinoIcons.play_rectangle,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (title.isNotEmpty) ...[
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CupertinoTheme.of(context).textTheme.textStyle
                        .copyWith(
                          fontSize: 13,
                          color: CupertinoColors.secondaryLabel.resolveFrom(
                            context,
                          ),
                        ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  subtitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: CupertinoTheme.of(context).textTheme.textStyle
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          if (onTap != null) ...[
            const SizedBox(width: 8),
            const CupertinoListTileChevron(),
          ],
        ],
      ),
    );
    return onTap == null
        ? content
        : CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onTap,
            child: content,
          );
  }
}
