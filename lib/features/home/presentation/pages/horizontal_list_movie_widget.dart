import 'package:flutter/material.dart';
import 'package:omdbapp/core/theme/omdb_text_style.dart';

class HorizontalListMovieWidget extends StatefulWidget {
  const HorizontalListMovieWidget({super.key});

  @override
  State<HorizontalListMovieWidget> createState() =>
      _HorizontalListMovieWidgetState();
}

class _HorizontalListMovieWidgetState extends State<HorizontalListMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your Next Watch",style: OMDBTextStyles.titleMedium,),
        SizedBox(
          height: 100,
          child: ListView.builder(
              itemCount: 10,
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              itemBuilder: (c, index) => Text("data")),
        ),
      ],
    );
  }
}
