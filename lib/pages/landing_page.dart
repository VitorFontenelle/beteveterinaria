import 'package:beteveterinaria/widgets/about_section.dart';
import 'package:beteveterinaria/widgets/cta_footer.dart';
import 'package:beteveterinaria/widgets/faq_section.dart';
import 'package:beteveterinaria/widgets/feline_section.dart';
import 'package:beteveterinaria/widgets/hero_section.dart';
import 'package:beteveterinaria/widgets/home_visit_section.dart';
import 'package:beteveterinaria/widgets/landing_header.dart';
import 'package:beteveterinaria/widgets/services_section.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Semantics(
        label:
            'Landing page da Dra. Elisabete Nascimento, médica veterinária em Fortaleza especializada em felinos',
        child: CustomScrollView(
          slivers: const [
            SliverToBoxAdapter(child: LandingHeader()),
            SliverToBoxAdapter(child: HeroSection()),
            SliverToBoxAdapter(child: AboutSection()),
            SliverToBoxAdapter(child: ServicesSection()),
            SliverToBoxAdapter(child: HomeVisitSection()),
            SliverToBoxAdapter(child: FelineSection()),
            SliverToBoxAdapter(child: FaqSection()),
            SliverToBoxAdapter(child: CtaSection()),
            SliverToBoxAdapter(child: LandingFooter()),
          ],
        ),
      ),
    );
  }
}
