/// Site URL and SEO strings shared with web/index.html (keep in sync).
class SeoConfig {
  static const String siteUrl = String.fromEnvironment(
    'SITE_URL',
    defaultValue: 'https://beteveterinaria.com',
  );

  static const String pageTitle =
      'Veterinária em Fortaleza | Dra. Elisabete Nascimento — Especialista em Felinos';

  static const String metaDescription =
      'Médica veterinária em Fortaleza especializada em felinos. Consultas presenciais em Fortaleza, Caucaia e Eusébio, e teleconsulta para todo o Brasil. Agende pelo WhatsApp.';

  static const String keywords =
      'veterinária Fortaleza, médica veterinária Fortaleza, veterinária domiciliar Fortaleza, especialista em felinos, veterinária de gatos, consulta veterinária online, veterinária Caucaia, veterinária Eusébio, Elisabete Nascimento, beteveterinaria';

  static const String author = 'Dra. Elisabete Nascimento';
}
