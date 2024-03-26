import 'package:flutter/material.dart';

class GradientMap extends StatelessWidget {
  final Color color1;
  final Color color2;
  final double contrast;
  final ImageProvider imageProvider;
  final double? height;
  final double? width;

  const GradientMap({
    super.key,
    this.color1 = Colors.white,
    this.color2 = Colors.black,
    this.contrast = 0,
    required this.imageProvider,
    this.height,
    this.width,
  });

  ColorFilter grayscaleMatrix() => ColorFilter.matrix([
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        contrast - 0.4,
        contrast - 0.4,
        contrast - 0.4,
        1,
        0,
      ]);

  ColorFilter invertMatrix() => const ColorFilter.matrix([
        -1,
        0,
        0,
        0,
        255,
        0,
        -1,
        0,
        0,
        255,
        0,
        0,
        -1,
        0,
        255,
        0,
        0,
        0,
        1,
        0,
      ]);

  ColorFilter tintMatrix() {
    final int r = color2.red;
    final int g = color2.green;
    final int b = color2.blue;

    final double rTint = r / 255;
    final double gTint = g / 255;
    final double bTint = b / 255;

    const double scale = 2.04015; // Use 0 on mobile instead
    const double translate = 1 - scale * 0.5;

    return ColorFilter.matrix(<double>[
      (rTint * scale),
      (rTint * scale),
      (rTint * scale),
      (0),
      (r * translate),
      (gTint * scale),
      (gTint * scale),
      (gTint * scale),
      (0),
      (g * translate),
      (bTint * scale),
      (bTint * scale),
      (bTint * scale),
      (0),
      (b * translate),
      (0),
      (0),
      (0),
      (1),
      (0),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 250,
      ),
      height: height,
      width: width,
      color: color1,
      child: ColorFiltered(
        colorFilter: tintMatrix(),
        child: ColorFiltered(
          colorFilter: invertMatrix(),
          child: ColorFiltered(
            colorFilter: grayscaleMatrix(),
            child: Image(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
