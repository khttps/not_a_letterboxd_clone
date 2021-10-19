import 'package:flutter/material.dart';
import '../core/palette.dart';

class MainRefreshIndicator extends RefreshIndicator {
  const MainRefreshIndicator({
    required RefreshCallback onRefresh,
    required Widget child,
    Key? key,
  }) : super(
          color: Palette.primary,
          backgroundColor: Colors.white,
          child: child,
          onRefresh: onRefresh,
          key: key,
        );
}
