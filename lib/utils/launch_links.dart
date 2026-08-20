import 'package:beteveterinaria/data/landing_content.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openExternalUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

Future<void> openWhatsApp() => openExternalUrl(LandingContent.whatsappUrl);

Future<void> openInstagram() => openExternalUrl(LandingContent.instagramUrl);
