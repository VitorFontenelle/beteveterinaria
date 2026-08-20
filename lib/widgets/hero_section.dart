import 'package:beteveterinaria/data/landing_content.dart';
import 'package:beteveterinaria/theme/app_theme.dart';
import 'package:beteveterinaria/widgets/contact_buttons.dart';
import 'package:beteveterinaria/widgets/responsive.dart';
import 'package:beteveterinaria/widgets/seo_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    final titleSize = Responsive.heroTitleSize(context);

    return DecoratedBox(
      decoration: BoxDecoration(gradient: brandGradientSoft),
      child: ContentContainer(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            Responsive.horizontalPadding(context),
            mobile ? 28 : 48,
            Responsive.horizontalPadding(context),
            mobile ? 40 : 64,
          ),
          child: FadeTransition(
            opacity: _fade,
            child: SlideTransition(
              position: _slide,
              child: mobile ? _buildMobile(titleSize) : _buildDesktop(titleSize),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktop(double titleSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 6, child: _copyColumn(titleSize, TextAlign.left)),
        const SizedBox(width: 40),
        Expanded(flex: 5, child: _heroPhoto()),
      ],
    );
  }

  Widget _buildMobile(double titleSize) {
    return Column(
      children: [
        _heroPhoto(maxHeight: 360),
        const SizedBox(height: 28),
        _copyColumn(titleSize, TextAlign.center),
      ],
    );
  }

  Widget _copyColumn(double titleSize, TextAlign align) {
    return Column(
      crossAxisAlignment: align == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        SeoBodyText(
          text: LandingContent.heroEyebrow,
          textAlign: align,
          style: TextStyle(
            color: AppColors.lavandaDeep,
            fontWeight: FontWeight.w700,
            fontSize: 13,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 14),
        SeoHeading(
          text: LandingContent.brandName,
          textAlign: align,
          style: GoogleFonts.fraunces(
            fontSize: titleSize * 0.72,
            fontWeight: FontWeight.w700,
            color: AppColors.rosaDeep,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 10),
        SeoHeading(
          text: LandingContent.heroHeadline,
          textAlign: align,
          style: GoogleFonts.fraunces(
            fontSize: titleSize * 0.78,
            fontWeight: FontWeight.w600,
            color: AppColors.text,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 16),
        SeoBodyText(
          text: LandingContent.heroSubhead,
          textAlign: align,
          style: TextStyle(
            fontSize: 17,
            height: 1.55,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 28),
        ContactButtons(centered: align == TextAlign.center),
      ],
    );
  }

  Widget _heroPhoto({double? maxHeight}) {
    return Semantics(
      image: true,
      label:
          'Dra. Elisabete Nascimento, médica veterinária em Fortaleza, em jaleco profissional',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight ?? 520),
          child: AspectRatio(
            aspectRatio: 4 / 5,
            child: Image.asset(
              'assets/photos/perfil-profissional-jaleco.jpg',
              fit: BoxFit.cover,
              alignment: const Alignment(0, -0.15),
            ),
          ),
        ),
      ),
    );
  }
}
