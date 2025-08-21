import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:omdbapp/gen/colors.gen.dart';
import 'package:omdbapp/core/theme/omdb_text_style.dart';
import 'package:omdbapp/features/home/domain/entities/movie_entity.dart';
import 'package:omdbapp/features/home/presentation/bloc/home_cubit.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../core/widgets/widgets.dart';

class HorizontalListMovieWidget extends StatefulWidget {
  const HorizontalListMovieWidget({
    super.key,
    required this.title,
    required this.provider,
    required this.type,
  });

  final HomeCubit provider;
  final String type;
  final String title;

  @override
  State<HorizontalListMovieWidget> createState() =>
      _HorizontalListMovieWidgetState();
}

class _HorizontalListMovieWidgetState extends State<HorizontalListMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: widget.provider,
      builder: (context, state) {
        if (state is HomeSuccess) {
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
                    itemCount: state.movies.length,
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (c, index) => Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomImageNetworkWidget(
                          src: state.movies[index].posterPath!,
                          aspectRatio: 0.65,
                          fit: BoxFit.cover,
                        ),
                        Assets.img.playLarge.image(width: 54, height: 54),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
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
                    itemCount: 6,
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (c, index) => AspectRatio(
                      aspectRatio: 0.65,
                      child: Container(color: ColorValue.neutralLight1),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
