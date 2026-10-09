class FaqItem {
  const FaqItem({
    required this.question,
    required this.answer,
    this.hasContactLinks = false,
  });

  final String question;
  final String answer;
  final bool hasContactLinks;
}

class ServiceItem {
  const ServiceItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final String icon; // Material icon name key
}

class BenefitItem {
  const BenefitItem({required this.title, required this.description});

  final String title;
  final String description;
}

/// All landing copy in one place — keep mirrored in web/index.html #seo-content.
class LandingContent {
  static const brandName = 'beteveterinaria';
  static const doctorName = 'Dra. Elisabete Nascimento';
  static const crmv = 'CRMV-CE 3839';
  static const phoneDisplay = '+55 85 9959-6612';
  static const phoneE164 = '+558599596612';
  static const whatsappUrl = 'https://wa.me/558599596612';
  static const instagramUrl =
      'https://www.instagram.com/beteveterinaria?igsh=MWhvaWRidzQ4dTZxaQ==';
  static const instagramHandle = '@beteveterinaria';

  static const heroEyebrow =
      'Médica Veterinária em Fortaleza · A domicílio e online';

  static const heroHeadline =
      'Médica veterinária em Fortaleza — atendimento a domicílio e veterinário online.';

  static const heroSubhead =
      'Veterinário a domicílio em Fortaleza e região metropolitana, e veterinário online (teleconsulta) para todo o Brasil — com especial atenção aos felinos.';

  static const aboutTitle = 'Conheça a Dra. Elisabete';

  static const aboutBody =
      'Formada em Medicina Veterinária e pós-graduada em felinos, a Dra. Elisabete Nascimento é médica veterinária em Fortaleza e atende animais de pequeno porte com olhar clínico atento e acolhedor. Seu diferencial é a especialização em felinos: ela compreende o comportamento, as necessidades e o cuidado específico que os seus gatinhos merecem.';

  static const aboutCredentials =
      'Médica Veterinária · Pós-graduada em Felinos · $crmv';

  static const servicesTitle = 'Como posso atender o seu pet';

  static const servicesLead =
      'Médico veterinário em Fortaleza para quem busca atendimento a domicílio, na região ou veterinário online.';

  static const services = <ServiceItem>[
    ServiceItem(
      title: 'Veterinário a domicílio em Fortaleza',
      description:
          'Consulta veterinária presencial no conforto da sua casa em Fortaleza — CE, sem o estresse do deslocamento até uma clínica.',
      icon: 'home',
    ),
    ServiceItem(
      title: 'Região metropolitana de Fortaleza',
      description:
          'Também atendo a domicílio nas redondezas, incluindo Aquiraz, Caucaia, Eusébio e região, com taxa de locomoção. Consulte disponibilidade pelo WhatsApp.',
      icon: 'map',
    ),
    ServiceItem(
      title: 'Veterinário online para todo o Brasil',
      description:
          'Consulta veterinária online (teleconsulta) com orientação profissional à distância. Caso necessário, será feito encaminhamento para uma avaliação presencial.',
      icon: 'video',
    ),
    ServiceItem(
      title: 'Prescrição de medicamentos',
      description:
          'Quando clinicamente indicado, a consulta pode incluir a prescrição de medicamentos para o tratamento do seu pet.',
      icon: 'medication',
    ),
  ];

  static const homeVisitTitle = 'Por que veterinário a domicílio?';

  static const homeVisitLead =
      'Quem ama, cuida — e o atendimento veterinário a domicílio reduz o estresse do pet e facilita a rotina do tutor.';

  static const benefits = <BenefitItem>[
    BenefitItem(
      title: 'Menos estresse para o pet',
      description:
          'Gatos e cães costumam se sentir mais seguros no próprio ambiente, o que facilita o exame clínico.',
    ),
    BenefitItem(
      title: 'Comodidade para a família',
      description:
          'Sem filas, sem transporte e com horário combinado diretamente com você.',
    ),
    BenefitItem(
      title: 'Atenção individualizada',
      description:
          'Cada consulta é dedicada ao seu animal, com tempo para tirar dúvidas e alinhar o cuidado.',
    ),
  ];

  static const felineTitle = 'Especialista em felinos';

  static const felineBody =
      'Gatos não são cães pequenos. A Dra. Elisabete é pós-graduada em felinos e dedica atenção especial à medicina felina — do check-up de rotina aos cuidados que respeitam o temperamento e a saúde do seu gato.';

  static const faqTitle = 'Perguntas frequentes';

  static const faqLead =
      'Tire dúvidas comuns sobre veterinário online, atendimento a domicílio em Fortaleza e área de cobertura.';

  static const faqs = <FaqItem>[
    FaqItem(
      question: 'Vocês fazem veterinário online?',
      answer:
          'Sim. A Dra. Elisabete oferece veterinário online (teleconsulta / consulta veterinária online) para todo o Brasil, com orientação à distância. Em alguns casos, será necessário encaminhamento para uma avaliação presencial.',
    ),
    FaqItem(
      question: 'Tem médico veterinário a domicílio em Fortaleza?',
      answer:
          'Sim. O atendimento é veterinário a domicílio em Fortaleza — CE, e também na região metropolitana (incluindo Aquiraz, Caucaia, Eusébio e região, com taxa de locomoção).',
    ),
    FaqItem(
      question: 'Mas ela só atende gatos?',
      answer:
          'Não, ela atende animais de pequeno porte, tanto cães quanto gatos. A especialização em felinos é um diferencial, não uma restrição.',
    ),
    FaqItem(
      question: 'A consulta online inclui prescrição de medicamentos?',
      answer:
          'Quando clinicamente indicado, a consulta pode incluir a prescrição de medicamentos para o tratamento do seu pet.',
    ),
    FaqItem(
      question: 'Como agendar uma consulta?',
      answer:
          'O contato profissional é pelo WhatsApp +55 85 9959-6612 ou pelo Instagram @beteveterinaria. Envie uma mensagem e combine o melhor horário — presencial em Fortaleza ou veterinário online.',
      hasContactLinks: true,
    ),
    FaqItem(
      question:
          'Tem veterinários perto de mim com atendimento a domicílio em Fortaleza?',
      answer:
          'Sim. A Dra. Elisabete atende a domicílio em Fortaleza e na região metropolitana (Aquiraz, Caucaia, Eusébio e região). Envie seu bairro pelo WhatsApp para confirmar disponibilidade.',
    ),
    FaqItem(
      question: 'O que é atendimento veterinário em casa?',
      answer:
          'É a consulta veterinária realizada no lar do tutor — também chamada de veterinário a domicílio ou veterinária domiciliar — com menos estresse para o pet e horário combinado.',
    ),
    FaqItem(
      question: 'Atendem na região metropolitana de Fortaleza?',
      answer:
          'Sim. Há atendimento domiciliar em Aquiraz, Caucaia, Eusébio e outras cidades da RM de Fortaleza, com taxa de locomoção. Consulte pelo WhatsApp.',
    ),
  ];

  static const ctaTitle = 'Pronto para cuidar do seu pet?';

  static const ctaBody =
      'Fale com a Dra. Elisabete pelo WhatsApp e agende médico veterinário em Fortaleza a domicílio, ou veterinário online para todo o Brasil.';

  static const whatsappLabel = 'Agendar pelo WhatsApp';
  static const instagramLabel = 'Seguir no Instagram';
}
