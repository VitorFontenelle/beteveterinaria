import 'package:beteveterinaria/data/landing_content.dart';
import 'package:beteveterinaria/theme/app_theme.dart';
import 'package:beteveterinaria/widgets/responsive.dart';
import 'package:beteveterinaria/widgets/seo_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
          child: mobile
              ? Column(
                  children: [
                    _logo(),
                    const SizedBox(height: 28),
                    _text(TextAlign.center),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 4, child: _logo()),
                    const SizedBox(width: 48),
                    Expanded(flex: 6, child: _text(TextAlign.left)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Image.asset(
      'assets/brand/logo-com-nome-vertical-colorido-transparente.png',
      height: 220,
      fit: BoxFit.contain,
      semanticLabel: 'Logo vertical Elisabete Nascimento Veterinária',
    );
  }

  Widget _text(TextAlign align) {
    return Column(
      crossAxisAlignment: align == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        SeoHeading(
          text: LandingContent.aboutTitle,
          textAlign: align,
          style: GoogleFonts.fraunces(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 16),
        SeoBodyText(
          text: LandingContent.aboutBody,
          textAlign: align,
          style: const TextStyle(fontSize: 16.5, height: 1.6),
        ),
        const SizedBox(height: 20),
        SeoBodyText(
          text: LandingContent.aboutCredentials,
          textAlign: align,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.lavandaDeep,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}
