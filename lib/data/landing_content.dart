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
      'Médica Veterinária em Fortaleza · Especialista em Felinos';

  static const heroHeadline = 'Cuidado veterinário próximo, com carinho de quem entende.';

  static const heroSubhead =
      'Consultas presenciais em Fortaleza e região, e atendimento online para todo o Brasil — com especial atenção aos felinos.';

  static const aboutTitle = 'Conheça a Dra. Elisabete';

  static const aboutBody =
      'Formada em Medicina Veterinária e pós-graduada em felinos, a Dra. Elisabete Nascimento atende animais de pequeno porte com olhar clínico atento e acolhedor. Seu diferencial é a especialização em gatos: ela compreende o comportamento, as necessidades e o cuidado específico que os felinos merecem.';

  static const aboutCredentials =
      'Médica Veterinária · Pós-graduada em Felinos · $crmv';

  static const servicesTitle = 'Como posso atender o seu pet';

  static const servicesLead =
      'Atendimento veterinário pensado para a rotina da sua família — em casa, na região ou online.';

  static const services = <ServiceItem>[
    ServiceItem(
      title: 'Consultas presenciais em Fortaleza',
      description:
          'Avaliação clínica no conforto da sua casa em Fortaleza — CE, sem o estresse do deslocamento até uma clínica.',
      icon: 'home',
    ),
    ServiceItem(
      title: 'Caucaia e Eusébio',
      description:
          'Também atendo nas redondezas, incluindo Caucaia e Eusébio, com taxa de locomoção. Consulte disponibilidade pelo WhatsApp.',
      icon: 'map',
    ),
    ServiceItem(
      title: 'Consultas online para todo o Brasil',
      description:
          'Teleconsulta veterinária com orientação profissional à distância. Em alguns casos, pode ser necessário encaminhamento para uma avaliação presencial.',
      icon: 'video',
    ),
    ServiceItem(
      title: 'Prescrição de medicamentos',
      description:
          'Quando clinicamente indicado, a consulta pode incluir a prescrição de medicamentos para o tratamento do seu pet.',
      icon: 'medication',
    ),
  ];

  static const homeVisitTitle = 'Por que atendimento domiciliar?';

  static const homeVisitLead =
      'Quem ama, cuida — e cuidar em casa reduz o estresse do pet e facilita a rotina do tutor.';

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
      'Tire dúvidas comuns sobre consultas presenciais, online e área de atendimento.';

  static const faqs = <FaqItem>[
    FaqItem(
      question: 'A Dra. Elisabete atende em Fortaleza?',
      answer:
          'Sim. Ela realiza consultas veterinárias presenciais em Fortaleza — Ceará, no conforto da casa do tutor.',
    ),
    FaqItem(
      question: 'Atende também em Caucaia ou Eusébio?',
      answer:
          'Sim. Atendimentos nas redondezas, como Caucaia e Eusébio, são possíveis com taxa de locomoção. Confirme disponibilidade pelo WhatsApp.',
    ),
    FaqItem(
      question: 'Como funciona a consulta online?',
      answer:
          'A teleconsulta é oferecida para todo o Brasil e permite orientação veterinária à distância. Em alguns casos, será necessário encaminhamento para uma avaliação presencial.',
    ),
    FaqItem(
      question: 'Ela é especialista em gatos?',
      answer:
          'Sim. Além de atender animais de pequeno porte, a Dra. Elisabete é pós-graduada em felinos e tem a medicina felina como destaque da sua prática.',
    ),
    FaqItem(
      question: 'É possível receber prescrição de medicamentos?',
      answer:
          'Quando clinicamente indicado, a consulta pode incluir a prescrição de medicamentos para o tratamento do seu pet.',
    ),
    FaqItem(
      question: 'Como agendar uma consulta?',
      answer:
          'O contato profissional é pelo WhatsApp +55 85 9959-6612 ou pelo Instagram @beteveterinaria. Envie uma mensagem e combine o melhor horário.',
      hasContactLinks: true,
    ),
  ];

  static const ctaTitle = 'Pronto para cuidar do seu pet?';

  static const ctaBody =
      'Fale com a Dra. Elisabete pelo WhatsApp e agende sua consulta presencial em Fortaleza e região, ou online para todo o Brasil.';

  static const whatsappLabel = 'Agendar pelo WhatsApp';
  static const instagramLabel = 'Seguir no Instagram';
}
