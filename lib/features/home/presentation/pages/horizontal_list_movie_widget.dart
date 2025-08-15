import 'package:flutter/material.dart';
import 'package:omdbapp/core/theme/omdb_text_style.dart';

import '../../../../core/gen/assets.gen.dart';

class HorizontalListMovieWidget extends StatefulWidget {
  const HorizontalListMovieWidget({super.key, required this.title});

  final String title;

  @override
  State<HorizontalListMovieWidget> createState() =>
      _HorizontalListMovieWidgetState();
}

class _HorizontalListMovieWidgetState extends State<HorizontalListMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: OMDBTextStyles.titleMedium),
          const SizedBox(height: 8),
          SizedBox(
            height: 188,
            child: ListView.separated(
              itemCount: 10,
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (c, index) => Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: AspectRatio(
                      aspectRatio: 0.65,
                      child: Assets.img.blasted.image(fit: BoxFit.cover),
                    ),
                  ),
                  Assets.img.playLarge.image(width: 54, height: 54),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
