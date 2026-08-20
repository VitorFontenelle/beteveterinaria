import 'package:beteveterinaria/data/landing_content.dart';
import 'package:beteveterinaria/theme/app_theme.dart';
import 'package:beteveterinaria/widgets/contact_buttons.dart';
import 'package:beteveterinaria/widgets/responsive.dart';
import 'package:beteveterinaria/widgets/seo_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return ColoredBox(
      color: AppColors.surface,
      child: ContentContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.horizontalPadding(context),
            vertical: mobile ? 48 : 72,
          ),
          child: Column(
            children: [
              SeoHeading(
                text: LandingContent.faqTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.fraunces(
                  fontSize: Responsive.sectionTitleSize(context),
                  fontWeight: FontWeight.w700,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 12),
              SeoBodyText(
                text: LandingContent.faqLead,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, height: 1.55),
              ),
              const SizedBox(height: 28),
              for (final item in LandingContent.faqs)
                _FaqTile(item: item),
            ],
          ),
        ),
      ),
    );
  }
}

class _FaqTile extends StatefulWidget {
  const _FaqTile({required this.item});

  final FaqItem item;

  @override
  State<_FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<_FaqTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.cream,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.lavanda.withValues(alpha: 0.22),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => setState(() => _expanded = !_expanded),
                  child: Row(
                    children: [
                      Expanded(
                        child: SeoHeading(
                          text: widget.item.question,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.text,
                          ),
                        ),
                      ),
                      AnimatedRotation(
                        turns: _expanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.lavandaDeep,
                        ),
                      ),
                    ],
                  ),
                ),
                // Keep answers in the tree for crawlers / a11y.
                ClipRect(
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    alignment: Alignment.topCenter,
                    heightFactor: _expanded ? 1 : 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: widget.item.hasContactLinks
                          ? const ScheduleFaqAnswer()
                          : SeoBodyText(
                              text: widget.item.answer,
                              style: const TextStyle(
                                fontSize: 15,
                                height: 1.55,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
