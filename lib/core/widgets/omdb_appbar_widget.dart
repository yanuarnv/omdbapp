import 'package:flutter/material.dart';
import 'package:omdbapp/core/widgets/widgets.dart';

import '../../features/search/presentation/pages/search_delegate.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';

class OmdbAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final Color backgroundColor;
  final Map<String, dynamic> chipIconAndText;
  final double bottomHeight;
  final VoidCallback? onDownloadPressed;
  final VoidCallback? onSearchPressed;
  final ValueNotifier bodyScrollListener;

  const OmdbAppbarWidget({
    super.key,
    this.title = "For Alex",
    this.centerTitle = false,
    this.backgroundColor = Colors.transparent,
    required this.chipIconAndText,
    this.bottomHeight = 48.0,
    this.onDownloadPressed,
    this.onSearchPressed,
    required this.bodyScrollListener,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: bodyScrollListener,
      builder: (context, value, _) {
        return AppBar(
          title: Text(title),
          centerTitle: centerTitle,
          backgroundColor:  Color(0xFFD22F26).withValues(alpha: value),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(bottomHeight),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                children: chipIconAndText.entries
                    .map((map) => OmdbChip(name: map.key, icon: map.value))
                    .toList(),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: onDownloadPressed ?? () {},
              icon: Assets.svg.downloadIcon.svg(
                colorFilter: ColorFilter.mode(
                  ColorValue.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            IconButton(
              onPressed:
                  onSearchPressed ??
                  () async {
                    await showSearch(
                      context: context,
                      delegate: OmDbSearchDelegate(),
                    );
                  },
              icon: Assets.svg.searchIcon.svg(
                colorFilter: ColorFilter.mode(
                  ColorValue.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + bottomHeight);
}
