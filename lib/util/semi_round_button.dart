import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

class SemiRoundedBorderButton extends StatelessWidget {
  final BorderSide borderSide;
  final BorderRadius radius;
  final ImageProvider background;
  final Widget child;
  final Color color;
  final num width, height;
  final onPressed;
  SemiRoundedBorderButton({
    Key key,
    this.borderSide = const BorderSide(color: Color(0x00ffffff), width: 0.0),
    this.color,
    @required this.radius,
    @required this.width,
    @required this.height,
    @required this.background,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRect(
        clipper: SemiRoundedBorderClipper(borderSide.width),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(color, BlendMode.darken),
                    image: background,
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    side: borderSide,
                    borderRadius: radius,
                  ),
                ),
                child: child,
              ),
            ),
            Positioned.fill(
              child: new Material(
                color: Colors.transparent,
                child: new InkWell(
                  borderRadius: radius,
                  // splashColor: Colors.lightGreenAccent,
                  onTap: () => onPressed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SemiRoundedBorderClipper extends CustomClipper<Rect> {
  final double borderStrokeWidth;

  SemiRoundedBorderClipper(this.borderStrokeWidth);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, size.width, size.height - borderStrokeWidth);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    if (oldClipper.runtimeType != SemiRoundedBorderClipper) return true;
    return (oldClipper as SemiRoundedBorderClipper).borderStrokeWidth !=
        borderStrokeWidth;
  }
}
