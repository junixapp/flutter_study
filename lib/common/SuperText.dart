import 'package:flutter/material.dart';

enum IconPosition { Left, Top, Right, Bottom }

/// 同时设置图片和文字
class SuperText extends StatelessWidget {
  final IconPosition iconPosition;
  final Icon icon;
  final double iconSpace;
  final String text;
  final TextStyle textStyle;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color bgColor;
  final AlignmentGeometry alignment;
  final BorderRadiusGeometry borderRadius;
  final Gradient gradient;
  final BoxBorder border;
  final VoidCallback onTap;
  final BoxConstraints constraints;

  SuperText(
      {this.iconPosition = IconPosition.Left,
      this.icon,
      this.iconSpace = 0,
      this.text,
      this.textStyle,
      this.width,
      this.height,
      this.padding,
      this.margin,
      this.bgColor,
      this.alignment = Alignment.center,
      this.borderRadius,
      this.gradient,
      this.border,
      this.onTap,
      this.constraints});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      alignment: alignment,
      constraints: constraints,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
          gradient: gradient,
          border: border),
      child: onTap == null
          ? (this.icon == null ? buildChild() : buildDirection())
          : InkWell(
              onTap: onTap,
              child: this.icon == null ? buildChild() : buildDirection(),
            ),
    );
  }

  Widget buildDirection() {
    if (iconPosition == IconPosition.Left ||
        iconPosition == IconPosition.Right) {
      return Row(
          children: buildChildren(),
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: buildChildren(),
    );
  }

  Widget buildChild() {
    return Text(
      text,
      style: textStyle,
    );
  }

  List<Widget> buildChildren() {
    if (iconPosition == IconPosition.Left || iconPosition == IconPosition.Top) {
      return <Widget>[
        if (icon != null) ...<Widget>[icon, buildSizeBox()],
        Text(
          text,
          style: textStyle,
        )
      ];
    } else {
      return <Widget>[
        Text(
          text,
          style: textStyle,
        ),
        if (icon != null) ...<Widget>[buildSizeBox(), icon]
      ];
    }
  }

  Widget buildSizeBox() {
    if (iconPosition == IconPosition.Left ||
        iconPosition == IconPosition.Right) {
      return SizedBox(
        width: iconSpace,
      );
    } else {
      return SizedBox(
        height: iconSpace,
      );
    }
  }
}
