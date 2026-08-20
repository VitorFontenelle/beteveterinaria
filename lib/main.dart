import 'package:beteveterinaria/data/seo_config.dart';
import 'package:beteveterinaria/pages/landing_page.dart';
import 'package:beteveterinaria/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(const BeteVeterinariaApp());
}

class BeteVeterinariaApp extends StatelessWidget {
  const BeteVeterinariaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: SeoConfig.pageTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const SelectionArea(child: LandingPage()),
    );
  }
}
