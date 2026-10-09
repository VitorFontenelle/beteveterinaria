/// Site URL and SEO strings shared with web/index.html (keep in sync).
class SeoConfig {
  static const String siteUrl = String.fromEnvironment(
    'SITE_URL',
    defaultValue: 'https://beteveterinaria.com',
  );

  static const String pageTitle =
      'Médica Veterinária em Fortaleza | Veterinário Online e a Domicílio';

  static const String metaDescription =
      'Médica veterinária em Fortaleza: veterinário a domicílio na capital e região metropolitana, e veterinário online (teleconsulta) para todo o Brasil. Especialista em felinos. Agende pelo WhatsApp.';

  static const String keywords =
      'veterinário, veterinária, veterinário em Fortaleza, veterinários perto de mim, veterinário a domicilio, veterinário a domicílio, atendimento em casa, veterinária domiciliar, médico veterinário em Fortaleza, veterinário online, teleconsulta veterinária, especialista em felinos, veterinária Aquiraz, veterinário Caucaia, veterinária Eusébio, região metropolitana Fortaleza, Elisabete Nascimento, beteveterinaria';

  static const String author = 'Dra. Elisabete Nascimento';
}
