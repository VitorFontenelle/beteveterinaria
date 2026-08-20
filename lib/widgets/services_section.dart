import 'dart:math' as math;

import 'package:beteveterinaria/data/landing_content.dart';
import 'package:beteveterinaria/theme/app_theme.dart';
import 'package:beteveterinaria/widgets/responsive.dart';
import 'package:beteveterinaria/widgets/seo_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  IconData _iconFor(String key) {
    return switch (key) {
      'home' => Icons.home_outlined,
      'map' => Icons.map_outlined,
      'video' => Icons.videocam_outlined,
      'medication' => Icons.medication_outlined,
      _ => Icons.pets_outlined,
    };
  }

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    final columns = mobile ? 1 : 2;
    final services = LandingContent.services;

    final rows = <List<ServiceItem>>[];
    for (var i = 0; i < services.length; i += columns) {
      rows.add(services.sublist(i, math.min(i + columns, services.length)));
    }

    return ColoredBox(
      color: AppColors.softLavanda.withValues(alpha: 0.45),
      child: ContentContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.horizontalPadding(context),
            vertical: mobile ? 48 : 72,
          ),
          child: Column(
            children: [
              SeoHeading(
                text: LandingContent.servicesTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.fraunces(
                  fontSize: Responsive.sectionTitleSize(context),
                  fontWeight: FontWeight.w700,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 12),
              SeoBodyText(
                text: LandingContent.servicesLead,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.5, height: 1.55),
              ),
              const SizedBox(height: 36),
              LayoutBuilder(
                builder: (context, constraints) {
                  return _EqualHeightServiceGrid(
                    key: ValueKey(
                      '${columns}_${constraints.maxWidth.toStringAsFixed(0)}',
                    ),
                    rows: rows,
                    columns: columns,
                    gap: 20,
                    iconFor: _iconFor,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Equalizes every card to the tallest natural card height in the grid.
class _EqualHeightServiceGrid extends StatefulWidget {
  const _EqualHeightServiceGrid({
    required this.rows,
    required this.columns,
    required this.gap,
    required this.iconFor,
  });

  final List<List<ServiceItem>> rows;
  final int columns;
  final double gap;
  final IconData Function(String key) iconFor;

  @override
  State<_EqualHeightServiceGrid> createState() =>
      _EqualHeightServiceGridState();
}

class _EqualHeightServiceGridState extends State<_EqualHeightServiceGrid> {
  late List<GlobalKey> _rowKeys;
  double? _cardHeight;

  @override
  void initState() {
    super.initState();
    _rowKeys = List.generate(widget.rows.length, (_) => GlobalKey());
    WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
  }

  @override
  void didUpdateWidget(covariant _EqualHeightServiceGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rows.length != widget.rows.length ||
        oldWidget.columns != widget.columns) {
      _rowKeys = List.generate(widget.rows.length, (_) => GlobalKey());
      _cardHeight = null;
      WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
    }
  }

  void _measure() {
    if (!mounted) return;
    var maxHeight = 0.0;
    for (final key in _rowKeys) {
      final box = key.currentContext?.findRenderObject() as RenderBox?;
      if (box != null && box.hasSize) {
        maxHeight = math.max(maxHeight, box.size.height);
      }
    }
    if (maxHeight <= 0) return;
    if (_cardHeight != null && (_cardHeight! - maxHeight).abs() < 0.5) return;
    setState(() => _cardHeight = maxHeight);
  }

  Widget _tile(ServiceItem service, {required double? height}) {
    return _ServiceTile(
      title: service.title,
      description: service.description,
      icon: widget.iconFor(service.icon),
      height: height,
    );
  }

  Widget _buildRow(List<ServiceItem> row, {Key? key, double? height}) {
    return KeyedSubtree(
      key: key,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < widget.columns; i++) ...[
              if (i > 0) SizedBox(width: widget.gap),
              Expanded(
                child: i < row.length
                    ? _tile(row[i], height: height)
                    : const SizedBox.shrink(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = _cardHeight;

    // On mobile (1 column), natural heights already look fine and equalizing
    // to the tallest would leave large empty gaps — keep content-sized.
    if (widget.columns == 1) {
      return Column(
        children: [
          for (var i = 0; i < widget.rows.length; i++) ...[
            if (i > 0) SizedBox(height: widget.gap),
            _tile(widget.rows[i].first, height: null),
          ],
        ],
      );
    }

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Invisible measure pass: each row height = tallest card in that row.
        Opacity(
          opacity: 0,
          child: IgnorePointer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var i = 0; i < widget.rows.length; i++) ...[
                  if (i > 0) SizedBox(height: widget.gap),
                  _buildRow(widget.rows[i], key: _rowKeys[i]),
                ],
              ],
            ),
          ),
        ),
        Column(
          children: [
            for (var i = 0; i < widget.rows.length; i++) ...[
              if (i > 0) SizedBox(height: widget.gap),
              _buildRow(widget.rows[i], height: height),
            ],
          ],
        ),
      ],
    );
  }
}

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({
    required this.title,
    required this.description,
    required this.icon,
    this.height,
  });

  final String title;
  final String description;
  final IconData icon;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.lavanda.withValues(alpha: 0.22)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: brandGradient,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: AppColors.white, size: 24),
              ),
              const SizedBox(height: 16),
              SeoHeading(
                text: title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 10),
              SeoBodyText(
                text: description,
                style: const TextStyle(fontSize: 15, height: 1.55),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
