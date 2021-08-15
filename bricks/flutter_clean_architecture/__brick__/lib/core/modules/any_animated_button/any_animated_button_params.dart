import 'package:flutter/material.dart';
import 'package:{{project_name}}/core/modules/any_animated_button/widgets/any_animated_button_error.dart';
import 'package:{{project_name}}/core/modules/any_animated_button/widgets/any_animated_button_progress.dart';
import 'package:{{project_name}}/core/modules/any_animated_button/widgets/any_animated_button_success.dart';

class AnyAnimatedButtonParams {
  AnyAnimatedButtonParams({
    required this.height,
    this.key,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.margin,
    this.transform,
    this.child = const SizedBox(),
  })  : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(decoration == null || decoration.debugAssertIsValid()),
        assert(
            color == null || decoration == null,
            'Cannot provide both a color and a decoration\n'
            'The color argument is just a shorthand for "decoration: BoxDecoration(color: color)".');

  static const double _size = 48.0;
  static const BorderRadius _borderRadius = BorderRadius.all(Radius.circular(45.0));

  final Key? key;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final Widget? child;

  static AnyAnimatedButtonParams progressParams({
    double? size,
    Color? color,
    EdgeInsets padding = const EdgeInsets.all(10.0),
  }) =>
      AnyAnimatedButtonParams(
        width: size ?? _size,
        height: size ?? _size,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: color ?? Colors.blue,
        ),
        child: AnyAnimatedButtonProgress(padding: padding),
      );

  static AnyAnimatedButtonParams successParams({
    double? size,
    Color? color,
    EdgeInsets padding = const EdgeInsets.all(8.0),
  }) =>
      AnyAnimatedButtonParams(
        width: size ?? _size,
        height: size ?? _size,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: color ?? Colors.green,
        ),
        child: AnyAnimatedButtonSuccess(padding: padding),
      );

  static AnyAnimatedButtonParams errorParams({
    double? size,
    Color? color,
    EdgeInsets padding = const EdgeInsets.all(8.0),
  }) =>
      AnyAnimatedButtonParams(
        width: size ?? _size,
        height: size ?? _size,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: color ?? Colors.red,
        ),
        child: AnyAnimatedButtonError(padding: padding),
      );

  AnyAnimatedButtonParams copyWith({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    Widget? child,
  }) {
    return AnyAnimatedButtonParams(
      key: key ?? this.key,
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      color: color ?? this.color,
      decoration: decoration ?? this.decoration,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      width: width ?? this.width,
      height: height ?? this.height,
      margin: margin ?? this.margin,
      transform: transform ?? this.transform,
      child: child ?? this.child,
    );
  }
}
