import 'package:flutter/material.dart';
import 'package:omdbapp/gen/colors.gen.dart';

class OmdbButton extends StatelessWidget {
  const OmdbButton({
    super.key,
    required this.onPress,
    required this.child,
    this.icon,
    this.style,
  });

  final GestureTapCallback onPress;
  final Widget child;
  final ButtonStyle? style;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style ?? primary,
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? const SizedBox.shrink(),
          const SizedBox(width: 8),
          child,
        ],
      ),
    );
  }

  static ButtonStyle get primary => ElevatedButton.styleFrom(
    backgroundColor: ColorValue.white,
    foregroundColor: ColorValue.black,
    elevation: 2,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static ButtonStyle get secondary => ElevatedButton.styleFrom(
    backgroundColor: ColorValue.neutralDark2,
    foregroundColor: ColorValue.white,
    elevation: 2,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}
