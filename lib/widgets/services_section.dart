import 'package:beteveterinaria/data/landing_content.dart';
import 'package:beteveterinaria/theme/app_theme.dart';
import 'package:beteveterinaria/widgets/responsive.dart';
import 'package:beteveterinaria/widgets/seo_text.dart';
import 'package:flutter/material.dart';

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
    final columns = Responsive.isDesktop(context)
        ? 2
        : Responsive.isMobile(context)
            ? 1
            : 2;

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
                style: TextStyle(
                  fontFamily: 'Fraunces',
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
                  final gap = 20.0;
                  final itemWidth = columns == 1
                      ? constraints.maxWidth
                      : (constraints.maxWidth - gap) / 2;
                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: [
                      for (final service in LandingContent.services)
                        SizedBox(
                          width: itemWidth,
                          child: _ServiceTile(
                            title: service.title,
                            description: service.description,
                            icon: _iconFor(service.icon),
                          ),
                        ),
                    ],
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

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
    );
  }
}
