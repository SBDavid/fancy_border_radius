import 'package:flutter/material.dart';

class FancyBorderRadiusWidget extends StatelessWidget {

  final double height;
  final double width;
  final EdgeInsets handle;
  final Widget child;

  const FancyBorderRadiusWidget(this.width, this.height, this.handle,
      {
        Key key,
        this.child
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    double topLeftX = width * handle.top;
    double topLeftY = height * (1 - handle.left);
    double topRightX = width * (1 - handle.top);
    double topRightY = height * (1 - handle.right);
    double bottomLeftX =  width * handle.bottom;
    double bottomLeftY = height * handle.left;
    double bottomRightX =  width * (1 - handle.bottom);
    double bottomRightY = height * handle.right;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.elliptical(topLeftX, topLeftY),
        topRight: Radius.elliptical(topRightX, topRightY),
        bottomLeft: Radius.elliptical(bottomLeftX, bottomLeftY),
        bottomRight: Radius.elliptical(bottomRightX, bottomRightY),
      ),
      child: Container(
        constraints: BoxConstraints(
          minWidth: width,
          maxWidth: width,
          minHeight: height,
          maxHeight: height,
        ),
        child: child,
      ),
    );
  }
}