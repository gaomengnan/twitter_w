import 'package:flutter/material.dart';

class ButtonLoading extends StatelessWidget {
  final bool isLoading;

  final Widget child;

  const ButtonLoading({
    super.key,
    this.isLoading = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
