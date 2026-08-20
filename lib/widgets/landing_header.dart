import 'package:beteveterinaria/theme/app_theme.dart';
import 'package:beteveterinaria/utils/launch_links.dart';
import 'package:beteveterinaria/widgets/contact_buttons.dart';
import 'package:beteveterinaria/widgets/responsive.dart';
import 'package:flutter/material.dart';

class LandingHeader extends StatelessWidget {
  const LandingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Material(
      color: AppColors.cream.withValues(alpha: 0.92),
      elevation: 0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.lavanda.withValues(alpha: 0.18),
            ),
          ),
        ),
        child: ContentContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.horizontalPadding(context),
              vertical: mobile ? 14 : 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/brand/logo-com-nome-horizontal-colorido-transparente.png',
                      height: mobile ? 40 : 48,
                      fit: BoxFit.contain,
                      semanticLabel:
                          'Logo Elisabete Nascimento Veterinária — beteveterinaria',
                    ),
                  ),
                ),
                if (mobile)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        tooltip: 'WhatsApp',
                        onPressed: openWhatsApp,
                        icon: const BrandIconImage(
                          asset: BrandIcons.whatsapp,
                          color: AppColors.rosaDeep,
                          size: 26,
                        ),
                      ),
                      IconButton(
                        tooltip: 'Instagram',
                        onPressed: openInstagram,
                        icon: const BrandIconImage(
                          asset: BrandIcons.instagram,
                          color: AppColors.lavandaDeep,
                          size: 26,
                        ),
                      ),
                    ],
                  )
                else
                  const ContactButtons(compact: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
