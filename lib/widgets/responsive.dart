import 'package:flutter/material.dart';

enum ScreenSize { mobile, tablet, desktop }

class Responsive {
  static const mobileBreakpoint = 640.0;
  static const tabletBreakpoint = 1024.0;
  static const maxContentWidth = 1120.0;

  static ScreenSize of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < mobileBreakpoint) return ScreenSize.mobile;
    if (width < tabletBreakpoint) return ScreenSize.tablet;
    return ScreenSize.desktop;
  }

  static bool isMobile(BuildContext context) =>
      of(context) == ScreenSize.mobile;

  static bool isDesktop(BuildContext context) =>
      of(context) == ScreenSize.desktop;

  static double horizontalPadding(BuildContext context) {
    return switch (of(context)) {
      ScreenSize.mobile => 20,
      ScreenSize.tablet => 40,
      ScreenSize.desktop => 48,
    };
  }

  static double heroTitleSize(BuildContext context) {
    return switch (of(context)) {
      ScreenSize.mobile => 30,
      ScreenSize.tablet => 40,
      ScreenSize.desktop => 48,
    };
  }

  static double sectionTitleSize(BuildContext context) {
    return switch (of(context)) {
      ScreenSize.mobile => 26,
      ScreenSize.tablet => 32,
      ScreenSize.desktop => 38,
    };
  }
}

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    super.key,
    required this.child,
    this.alignment = Alignment.topCenter,
  });

  final Widget child;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: Responsive.maxContentWidth),
        child: child,
      ),
    );
  }
}
