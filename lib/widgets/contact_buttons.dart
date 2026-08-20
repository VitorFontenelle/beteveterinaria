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
        ? _SolidContactButton(
            label: compact ? 'WhatsApp' : LandingContent.whatsappLabel,
            icon: Icons.chat_rounded,
            onPressed: openWhatsApp,
            compact: compact,
            background: AppColors.white,
            foreground: AppColors.rosaDeep,
          )
        : _GradientButton(
            label: compact ? 'WhatsApp' : LandingContent.whatsappLabel,
            icon: Icons.chat_rounded,
            onPressed: openWhatsApp,
            compact: compact,
          );

    final instagram = light
        ? _OutlinedContactButton(
            label: compact ? 'Instagram' : LandingContent.instagramLabel,
            icon: Icons.camera_alt_outlined,
            onPressed: openInstagram,
            compact: compact,
            foreground: AppColors.white,
            borderColor: AppColors.white.withValues(alpha: 0.75),
          )
        : _OutlinedContactButton(
            label: compact ? 'Instagram' : LandingContent.instagramLabel,
            icon: Icons.camera_alt_outlined,
            onPressed: openInstagram,
            compact: compact,
            foreground: AppColors.lavandaDeep,
            borderColor: AppColors.lavanda,
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
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 12,
      runSpacing: 12,
      children: [whatsapp, instagram],
    );
  }
}

EdgeInsets _contactPadding(bool compact) => EdgeInsets.symmetric(
      horizontal: compact ? 16 : 22,
      vertical: compact ? 12 : 16,
    );

TextStyle _contactLabelStyle(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 15,
      height: 1.2,
    );

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
            padding: _contactPadding(compact),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColors.white, size: 20),
                const SizedBox(width: 10),
                Text(label, style: _contactLabelStyle(AppColors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SolidContactButton extends StatelessWidget {
  const _SolidContactButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.background,
    required this.foreground,
    this.compact = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color background;
  final Color foreground;
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
            color: background,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: _contactPadding(compact),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: foreground, size: 20),
                const SizedBox(width: 10),
                Text(label, style: _contactLabelStyle(foreground)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlinedContactButton extends StatelessWidget {
  const _OutlinedContactButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.foreground,
    required this.borderColor,
    this.compact = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color foreground;
  final Color borderColor;
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
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Padding(
            padding: _contactPadding(compact),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: foreground, size: 20),
                const SizedBox(width: 10),
                Text(label, style: _contactLabelStyle(foreground)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Inline WhatsApp / Instagram text links for FAQ and footer.
class ContactTextLinks extends StatelessWidget {
  const ContactTextLinks({
    super.key,
    this.prefix = 'WhatsApp ',
    this.separator = ' · ',
    this.textAlign = TextAlign.center,
    this.style,
    this.linkColor,
  });

  final String prefix;
  final String separator;
  final TextAlign textAlign;
  final TextStyle? style;
  final Color? linkColor;

  @override
  Widget build(BuildContext context) {
    final base = style ??
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.white.withValues(alpha: 0.9),
        );
    final linkStyle = base.copyWith(
      color: linkColor ?? base.color,
      decoration: TextDecoration.underline,
      decorationColor: linkColor ?? base.color,
    );

    return Text.rich(
      TextSpan(
        style: base,
        children: [
          TextSpan(text: prefix),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: openWhatsApp,
              child: Text(
                LandingContent.phoneDisplay,
                style: linkStyle,
              ),
            ),
          ),
          TextSpan(text: separator),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: openInstagram,
              child: Text(
                LandingContent.instagramHandle,
                style: linkStyle,
              ),
            ),
          ),
        ],
      ),
      textAlign: textAlign,
    );
  }
}

/// FAQ answer that embeds clickable WhatsApp and Instagram links.
class ScheduleFaqAnswer extends StatelessWidget {
  const ScheduleFaqAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    const base = TextStyle(fontSize: 15, height: 1.55, color: AppColors.textMuted);
    const linkStyle = TextStyle(
      fontSize: 15,
      height: 1.55,
      color: AppColors.rosaDeep,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.rosaDeep,
    );

    return Text.rich(
      TextSpan(
        style: base,
        children: [
          const TextSpan(text: 'O contato profissional é pelo WhatsApp '),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: openWhatsApp,
              child: const Text(
                LandingContent.phoneDisplay,
                style: linkStyle,
              ),
            ),
          ),
          const TextSpan(text: ' ou pelo Instagram '),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: openInstagram,
              child: const Text(
                LandingContent.instagramHandle,
                style: linkStyle,
              ),
            ),
          ),
          const TextSpan(
            text: '. Envie uma mensagem e combine o melhor horário.',
          ),
        ],
      ),
    );
  }
}
