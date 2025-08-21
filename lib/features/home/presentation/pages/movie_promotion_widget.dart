import 'package:flutter/material.dart';
import 'package:omdbapp/gen/assets.gen.dart';
import 'package:omdbapp/core/theme/omdb_text_style.dart';
import 'package:omdbapp/core/widgets/widgets.dart';
class MoviePromotion extends StatelessWidget {
  const MoviePromotion({super.key,});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,

      child: Stack(
        children: [
          Center(child: Assets.img.sample.image()),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Row(
              children: [
                Expanded(
                  child: OmdbButton(
                    icon: Icon(Icons.play_arrow),
                    onPress: () {},
                    child: Text("Play", style: OMDBTextStyles.titleMedium),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OmdbButton(
                    style: OmdbButton.secondary,
                    icon: Icon(Icons.add),
                    onPress: () {},
                    child: Text("My List", style: OMDBTextStyles.titleMedium),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}