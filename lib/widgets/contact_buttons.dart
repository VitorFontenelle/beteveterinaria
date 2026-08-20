import 'package:beteveterinaria/data/landing_content.dart';
import 'package:beteveterinaria/theme/app_theme.dart';
import 'package:beteveterinaria/utils/launch_links.dart';
import 'package:beteveterinaria/widgets/responsive.dart';
import 'package:flutter/material.dart';

class ContactButtons extends StatelessWidget {
  const ContactButtons({
    super.key,
    this.compact = false,
    this.centered = false,
    this.light = false,
  });

  final bool compact;
  final bool centered;
  final bool light;

  @override
  Widget build(BuildContext context) {
    final whatsapp = light
        ? FilledButton.icon(
            onPressed: openWhatsApp,
            icon: const Icon(Icons.chat_rounded, size: 20),
            label: Text(compact ? 'WhatsApp' : LandingContent.whatsappLabel),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.rosaDeep,
              padding: EdgeInsets.symmetric(
                horizontal: compact ? 16 : 22,
                vertical: compact ? 12 : 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          )
        : _GradientButton(
            label: compact ? 'WhatsApp' : LandingContent.whatsappLabel,
            icon: Icons.chat_rounded,
            onPressed: openWhatsApp,
            compact: compact,
          );

    final instagram = OutlinedButton.icon(
      onPressed: openInstagram,
      icon: Icon(
        Icons.camera_alt_outlined,
        size: 18,
        color: light ? AppColors.white : AppColors.lavandaDeep,
      ),
      label: Text(
        compact ? 'Instagram' : LandingContent.instagramLabel,
        style: TextStyle(
          color: light ? AppColors.white : AppColors.lavandaDeep,
        ),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: light ? AppColors.white : AppColors.lavandaDeep,
        side: BorderSide(
          color: light
              ? AppColors.white.withValues(alpha: 0.75)
              : AppColors.lavanda,
          width: 1.5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 16 : 22,
          vertical: compact ? 12 : 16,
        ),
      ),
    );

    if (Responsive.isMobile(context) && !compact) {
      return Column(
        crossAxisAlignment:
            centered ? CrossAxisAlignment.center : CrossAxisAlignment.stretch,
        children: [
          whatsapp,
          const SizedBox(height: 12),
          instagram,
        ],
      );
    }

    return Wrap(
      alignment: centered ? WrapAlignment.center : WrapAlignment.start,
      spacing: 12,
      runSpacing: 12,
      children: [whatsapp, instagram],
    );
  }
}

class _GradientButton extends StatelessWidget {
  const _GradientButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.compact = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          decoration: BoxDecoration(
            gradient: brandGradient,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: AppColors.rosa.withValues(alpha: 0.28),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: compact ? 16 : 22,
              vertical: compact ? 12 : 16,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColors.white, size: 20),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
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
