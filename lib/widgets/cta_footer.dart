import 'package:beteveterinaria/data/landing_content.dart';
import 'package:beteveterinaria/theme/app_theme.dart';
import 'package:beteveterinaria/widgets/contact_buttons.dart';
import 'package:beteveterinaria/widgets/responsive.dart';
import 'package:beteveterinaria/widgets/seo_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: mobile ? 24 : 32,
      ),
      child: ContentContainer(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: brandGradient,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mobile ? 24 : 48,
              vertical: mobile ? 40 : 52,
            ),
            child: Column(
              children: [
                SeoHeading(
                  text: LandingContent.ctaTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.fraunces(
                    fontSize: mobile ? 28 : 34,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 12),
                SeoBodyText(
                  text: LandingContent.ctaBody,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.55,
                    color: AppColors.white.withValues(alpha: 0.92),
                  ),
                ),
                const SizedBox(height: 28),
                const ContactButtons(centered: true, light: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LandingFooter extends StatelessWidget {
  const LandingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;

    return ColoredBox(
      color: AppColors.footerBg,
      child: ContentContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.horizontalPadding(context),
            vertical: 40,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/brand/logo-com-nome-horizontal-branco-transparente.png',
                height: 44,
                fit: BoxFit.contain,
                semanticLabel: 'Logo beteveterinaria',
              ),
              const SizedBox(height: 20),
              SeoBodyText(
                text:
                    '${LandingContent.doctorName} · ${LandingContent.crmv}\n'
                    'Veterinária domiciliar em Fortaleza, Caucaia e Eusébio · '
                    'Consultas online para todo o Brasil',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.55,
                  color: AppColors.white.withValues(alpha: 0.78),
                ),
              ),
              const SizedBox(height: 16),
              ContactTextLinks(
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white.withValues(alpha: 0.9),
                ),
                linkColor: AppColors.white,
              ),
              const SizedBox(height: 24),
              SeoBodyText(
                text: '© $year ${LandingContent.brandName}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.white.withValues(alpha: 0.55),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
