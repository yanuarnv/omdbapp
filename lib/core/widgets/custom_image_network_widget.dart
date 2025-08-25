import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:omdbapp/gen/colors.gen.dart';

class CustomImageNetworkWidget extends StatelessWidget {
  const CustomImageNetworkWidget({
    super.key,
    required this.src,
    required this.aspectRatio,
    required this.fit,
  });

  final String src;
  final double aspectRatio;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    try{
      final baseNetworkUrl = dotenv.get("IMG_BASE_URL");
      return AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          decoration: BoxDecoration(color: ColorValue.neutralLight1),
          child: Image.network(baseNetworkUrl + src, fit: fit),
        ),
      );
    }catch(e){
      print(e);
      return AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          decoration: BoxDecoration(color: ColorValue.neutralLight1),
        ),
      );
    }

  }
}
