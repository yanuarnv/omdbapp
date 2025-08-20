import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omdbapp/core/gen/colors.gen.dart';
import 'package:omdbapp/core/widgets/omdb_appbar_widget.dart';
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

  final ScrollController _bgScrollController = ScrollController();
  final ValueNotifier<double> _isScrolled = ValueNotifier<double>(1);

  @override
  void initState() {
    // TODO: implement initState
    _bgScrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    // Access the current scroll offset
    double currentOffset = _bgScrollController.offset;
    //   if currentOffset = 460 bg should be invisible
    if (currentOffset < 460) {
      final valueScrollConvert = 100 - (currentOffset * 100 / 460);
      _isScrolled.value = valueScrollConvert / 100;
    } else {
      if (_isScrolled.value > 0) {
        _isScrolled.value = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OmdbAppbarWidget(
        chipIconAndText: chipIconAndText,
        bodyScrollListener: _isScrolled,
      ),
      body: SingleChildScrollView(
        controller: _bgScrollController,
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: ValueListenableBuilder(
                  valueListenable: _isScrolled,
                  builder: (context, value, _) {
                    print(value);
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFD22F26).withValues(alpha: value),
                            Color(0xFF8B1A1A).withValues(alpha: value),
                            Color(0xFF1A0505).withValues(alpha: value),
                            Color(0xFF000000),
                          ],
                          stops: [0.0, 0.3, 0.5, 1.0],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Column(
                children: [
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
