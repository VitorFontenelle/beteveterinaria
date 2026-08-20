import 'package:beteveterinaria/data/landing_content.dart';
import 'package:beteveterinaria/theme/app_theme.dart';
import 'package:beteveterinaria/widgets/responsive.dart';
import 'package:beteveterinaria/widgets/seo_text.dart';
import 'package:flutter/material.dart';

class FelineSection extends StatelessWidget {
  const FelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.softRosa,
            AppColors.softLavanda.withValues(alpha: 0.7),
          ],
        ),
      ),
      child: ContentContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.horizontalPadding(context),
            vertical: mobile ? 48 : 72,
          ),
          child: mobile
              ? Column(
                  children: [
                    _photo(),
                    const SizedBox(height: 28),
                    _copy(TextAlign.center),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 5, child: _photo()),
                    const SizedBox(width: 44),
                    Expanded(flex: 5, child: _copy(TextAlign.left)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _photo() {
    return Semantics(
      image: true,
      label:
          'Dra. Elisabete Nascimento segurando um gato preto — especialista em felinos',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: AspectRatio(
          aspectRatio: 4 / 5,
          child: Image.asset(
            'assets/photos/segurando-cliente.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _copy(TextAlign align) {
    return Column(
      crossAxisAlignment: align == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        SeoHeading(
          text: LandingContent.felineTitle,
          textAlign: align,
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 16),
        SeoBodyText(
          text: LandingContent.felineBody,
          textAlign: align,
          style: const TextStyle(fontSize: 16.5, height: 1.6),
        ),
      ],
    );
  }
}
