import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omdbapp/core/gen/colors.gen.dart';
import 'package:omdbapp/core/widgets/widgets.dart';
import 'package:omdbapp/features/home/presentation/pages/horizontal_list_movie_widget.dart';
import 'package:omdbapp/features/search/presentation/pages/search_delegate.dart';

import '../../../../core/gen/assets.gen.dart';
import 'movie_promotion_widget.dart';

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.svg.downloadIcon.svg(
              colorFilter: ColorFilter.mode(ColorValue.white, BlendMode.srcIn),
            ),
          ),
          IconButton(
            onPressed: () async{
              await showSearch(context: context, delegate: OmDbSearchDelegate());
            },
            icon: Assets.svg.searchIcon.svg(
              colorFilter: ColorFilter.mode(ColorValue.white, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFD22F26),
                        Color(0xFF8B1A1A),
                        Color(0xFF1A0505),
                        Color(0xFF000000),
                      ],
                      stops: [0.0, 0.3, 0.6, 1.0],
                    ),
                  ),
                ),
              ),
              Column(
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
                  const SizedBox(height: 16),
                  HorizontalListMovieWidget(title: "Your Next Watch"),
                  const SizedBox(height: 16),
                  HorizontalListMovieWidget(title: "Top Week"),
                  const SizedBox(height: 16),
                  HorizontalListMovieWidget(title: "Up Coming"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
