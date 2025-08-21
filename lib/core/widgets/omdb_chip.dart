import 'package:flutter/material.dart';
import 'package:omdbapp/gen/colors.gen.dart';
class OmdbChip extends StatelessWidget {
  @Preview(name: "Omdb Chip")
  const OmdbChip({
    super.key,
    required this.name,
     this.icon
  });

  final String name;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      margin: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: ColorValue.white),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name),
          const SizedBox(width: 8,),
          icon ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
