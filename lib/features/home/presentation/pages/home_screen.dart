import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdbapp/core/di/injection.dart';
import 'package:omdbapp/gen/colors.gen.dart';
import 'package:omdbapp/core/widgets/omdb_appbar_widget.dart';
import 'package:omdbapp/core/widgets/widgets.dart';
import 'package:omdbapp/features/home/presentation/bloc/home_cubit.dart';
import 'package:omdbapp/features/home/presentation/pages/horizontal_list_movie_widget.dart';
import 'package:omdbapp/features/search/presentation/pages/search_delegate.dart';

import '../../../../gen/assets.gen.dart';
import 'movie_promotion_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final topRatedCubit = getIt<HomeCubit>();
  final popularCubit = getIt<HomeCubit>();
  final upComingCubit = getIt<HomeCubit>();
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
    popularCubit.fetchMovies('popular');
    topRatedCubit.fetchMovies('top_rated');
    upComingCubit.fetchMovies('upcoming');
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    MoviePromotion(),
                    const SizedBox(height: 16),
                    BlocProvider(
                      create: (_) => popularCubit,
                      child: HorizontalListMovieWidget(
                        title: "Your Next Watch",
                        provider: popularCubit,
                        type: 'popular',
                      ),
                    ),
                    const SizedBox(height: 16),
                    BlocProvider(
                      create: (_) => topRatedCubit,
                      child: HorizontalListMovieWidget(
                        title: "Top Week",
                        provider: topRatedCubit, type: 'top_rated',
                      ),
                    ),
                    const SizedBox(height: 16),
                    BlocProvider(
                      create: (_) => upComingCubit,
                      child: HorizontalListMovieWidget(
                        title: "Up Coming",
                        provider: upComingCubit, type: 'upcoming',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
