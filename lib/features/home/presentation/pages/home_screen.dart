import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omdbapp/core/gen/assets.gen.dart';
import 'package:omdbapp/core/theme/omdb_text_style.dart';
import 'package:omdbapp/core/widgets/omdb_button.dart';
import 'package:omdbapp/core/widgets/widgets.dart';
import 'package:omdbapp/features/home/presentation/pages/horizontal_list_movie_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final chipIconAndText = <String, Widget?>{
    'TV Shows': null,
    'Movies': null,
    'Categories': Icon(CupertinoIcons.chevron_down, size: 16),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("For Alex"),
        centerTitle: false,
        backgroundColor: Color(0xFFD22F26),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFD22F26),
                  Color(0xFF8B1A1A),
                  Color(0xFF4A0E0E),
                  Color(0xFF1A0505),
                  Color(0xFF000000),
                ],
                stops: [0.0, 0.3, 0.6, 0.8, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      children: chipIconAndText.entries
                          .map(
                            (map) => OmdbChip(name: map.key, icon: map.value),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  MoviePromotion(),
                  HorizontalListMovieWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
