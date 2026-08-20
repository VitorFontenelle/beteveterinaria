import 'package:flutter/material.dart';

/// Body copy exposed to assistive tech with selectable text.
class SeoBodyText extends StatelessWidget {
  const SeoBodyText({
    super.key,
    required this.text,
    required this.style,
    this.textAlign,
  });

  final String text;
  final TextStyle style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: text,
      child: ExcludeSemantics(
        child: SelectableText(
          text,
          textAlign: textAlign,
          style: style,
        ),
      ),
    );
  }
}

/// Text styled for the UI but exposed as a heading for a11y / crawlers.
class SeoHeading extends StatelessWidget {
  const SeoHeading({
    super.key,
    required this.text,
    required this.style,
    this.textAlign,
  });

  final String text;
  final TextStyle style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      label: text.replaceAll('\n', ' '),
      child: ExcludeSemantics(
        child: SelectableText(
          text,
          textAlign: textAlign,
          style: style,
        ),
      ),
    );
  }
}
