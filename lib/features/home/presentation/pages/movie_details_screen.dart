import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omdbapp/core/theme/omdb_text_style.dart';
import 'package:omdbapp/core/widgets/custom_image_network_widget.dart';
import 'package:omdbapp/core/widgets/omdb_button.dart';
import 'package:omdbapp/gen/colors.gen.dart';

import '../../../../core/widgets/omdb_appbar_widget.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/movie_entity.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieEntity model;

  const MovieDetailsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 210,
          child: Stack(
            children: [
              CustomImageNetworkWidget(
                src: model.posterPath.toString(),
                fit: BoxFit.cover,
                aspectRatio: 2,
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.close, color: Colors.white),
                ),
              ),
              Center(child: Assets.img.playLarge.image(width: 54, height: 54)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.title, style: OMDBTextStyles.titleLarge),
              const SizedBox(height: 8),
              Text(model.releaseDate, style: OMDBTextStyles.bodyMedium),
              const SizedBox(height: 8),
              OmdbButton(
                icon: Icon(Icons.play_arrow),
                onPress: () {},
                child: Text("Play", style: OMDBTextStyles.titleMedium),
              ),
              const SizedBox(height: 8),
              OmdbButton(
                style: OmdbButton.secondary,
                icon: Icon(Icons.add),
                onPress: () {},
                child: Text("My List", style: OMDBTextStyles.titleMedium),
              ),
              const SizedBox(height: 16),
              Text(model.originalTitle, style: OMDBTextStyles.titleLarge),
              Text(model.overview, style: OMDBTextStyles.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}
