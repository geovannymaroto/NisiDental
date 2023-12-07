import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login_Citas
  {
    'bov2q47x': {
      'es':
          'Estimado cliente si usted ingresa por primera vez lo invitamos a registrarse.',
      'en': '',
    },
    'ozs7xis2': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'p9s1u1lr': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'ld90q7je': {
      'es': 'Ingresar',
      'en': 'Sign in',
    },
    'ma23xa6j': {
      'es': 'Registrar',
      'en': 'Sign up',
    },
    'xgmj33h0': {
      'es': '¿Olvidó su contraseña?',
      'en': 'Forgot your password?',
    },
    'bkbcbbff': {
      'es': 'Admin',
      'en': 'Admin',
    },
    'wf2ha32i': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    '3rcvte7j': {
      'es': 'Elija una opción del menu desplegable',
      'en': 'Please choose an option from the dropdown',
    },
    'q7v9ntl8': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    '323ucu9u': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'gkdluj1n': {
      'es': 'NisiDental',
      'en': 'NisiDental',
    },
    '0vtzf58e': {
      'es': 'Inicio',
      'en': 'home',
    },
  },
  // Inicio_Citas
  {
    '55egs7ex': {
      'es': 'Agendar Cita',
      'en': 'Schedule Appointment',
    },
    's8ecfa5t': {
      'es': 'Ver historial',
      'en': 'View history',
    },
    'jwsv5rn0': {
      'es': 'Admin',
      'en': 'Admin',
    },
    'leex037o': {
      'es': 'Inicio',
      'en': 'Home',
    },
    '2rk3aiz4': {
      'es': 'Inicio',
      'en': 'home',
    },
  },
  // CrearCita
  {
    '8lihhevb': {
      'es': 'Crear Cita',
      'en': 'Create Appointment',
    },
    'u9iyx58b': {
      'es': 'Hora     ',
      'en': 'Hour',
    },
    'o36bz804': {
      'es': 'Seleccionar..',
      'en': 'Please select...',
    },
    'kituqlt6': {
      'es': 'Busca una opción',
      'en': 'Search for an item...',
    },
    'rinr4pfi': {
      'es': 'Doctor',
      'en': 'Doctor',
    },
    'nbubdoop': {
      'es': 'Seleccionar...',
      'en': 'Select...',
    },
    'gqrd763r': {
      'es': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '5k4948sr': {
      'es': 'Motivo',
      'en': 'Reason',
    },
    'z5e68t8c': {
      'es': 'Seleccionar...',
      'en': 'Select...',
    },
    '6ffneaqi': {
      'es': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '22e7kke0': {
      'es': 'Crear Cita',
      'en': 'Create Appointment',
    },
    'yd8upjnj': {
      'es': 'Volver',
      'en': 'go back',
    },
    '0b981nh4': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // Historial
  {
    '8nwq7nuz': {
      'es': 'Fecha',
      'en': 'Date',
    },
    'p3p3b8r9': {
      'es': 'Motivo',
      'en': 'Reason',
    },
    'uq9iotr8': {
      'es': 'Volver\n',
      'en': 'Go back',
    },
    'urgaog64': {
      'es': 'Historial',
      'en': 'Record',
    },
    'oxl1ldx2': {
      'es': 'inicio',
      'en': 'Home',
    },
  },
  // Profesionales
  {
    'fhk68j9y': {
      'es': '            NISI Dental',
      'en': 'NISI Dental',
    },
    'z5hmrxq3': {
      'es': 'Bio',
      'en': 'Bio',
    },
    'jriy8hgf': {
      'es':
          'Brinda el más cálido servicio en Odontología  de mano de altos profesionales, con equipos de alta tecnología, y excelentes instalaciones.\n\nNuestro equipo de profesionales con grandes capacidades y conocimientos en el campo de la salud dental está a su más atenta disposición.',
      'en':
          'It provides the warmest service in Dentistry by senior professionals, with high-tech equipment, and excellent facilities.\n\nOur team of professionals with great skills and knowledge in the field of dental health is at your most attentive disposal.',
    },
    'tdije9s7': {
      'es': 'Dr.Dennis Quintero',
      'en': 'Dr. Dennis Quintero',
    },
    '4t4r73pf': {
      'es':
          '- Conferencista nacional e internacional.\n- Gold Member Style Italiano Endodontics\n- Especialista Salvando Dientes\n',
      'en':
          '- National and international speaker.\n- Gold Member Style Italiano Endodontics\n- Teeth Saving Specialist',
    },
    'kxkaziah': {
      'es':
          'El Dr.  Dennis, cofundador de NISI Dental, profesional apasionado por la odontología.\n\nSu compromiso con la salud bucal contribuye al bienestar integral de quienes confían en su experiencia y dedicación.',
      'en':
          'Dr. Dennis, co-founder of NISI Dental, professional with a passion for dentistry.\n\nTheir commitment to oral health contributes to the comprehensive well-being of those who trust in their experience and dedication.',
    },
    'jk9l4gx5': {
      'es': 'Dr. Jason Quintero',
      'en': 'Dr. Jason Quintero',
    },
    'cm3k6k2y': {
      'es':
          '-Odontologo general\n-Se especializa en tratamiento de alineadores',
      'en': '-General dentist\n-Specializes in aligner treatment',
    },
    'bde28jym': {
      'es':
          'El Dr.  Jason, cofundador de NISI Dental.\nEl profesional en odontología, más allá de ser un experto en técnicas y procedimientos, es un cuidador dedicado que valora la importancia de una sonrisa saludable en la calidad de vida.',
      'en':
          'Dr. Jason, co-founder of NISI Dental.\nThe dental professional, beyond being an expert in techniques and procedures, is a dedicated caregiver who values ​​the importance of a healthy smile in the quality of life.',
    },
    'fd16q3k6': {
      'es': 'Raquel Madrigal',
      'en': 'Raquel Madrigal',
    },
    'mfnfyp9k': {
      'es': 'Asistente en NISI',
      'en': 'Assistant at NISI',
    },
    'ajhaer6y': {
      'es':
          'Es asistente de NISI desde hace 5 años, nos brinda  el funcionamiento eficiente y acogedor de la práctica odontológica. Su destreza administrativa y habilidades interpersonales hacen que la experiencia del paciente sea fluida y cómoda desde el momento en que ingresan por la puerta.',
      'en':
          'He has been an NISI assistant for 5 years, providing us with the efficient and welcoming operation of the dental practice. Her administrative prowess and interpersonal skills make the patient experience seamless and comfortable from the moment they walk in the door.',
    },
    '9sz3vvt1': {
      'es': 'Angie León',
      'en': 'Angie Leon',
    },
    'pijsmng0': {
      'es': 'Asistente en NISI',
      'en': 'Assistant at NISI',
    },
    'qqy1issn': {
      'es':
          'Es asistente en NISI desde hace 8 años no solo es la experta en logística detrás de escena, sino también la sonrisa amigable que da la bienvenida y guía a los pacientes en su viaje hacia una salud bucal óptima.',
      'en':
          'An assistant at NISI for 8 years, she is not only the behind-the-scenes logistics expert, but also the friendly smile that welcomes and guides patients on their journey to optimal oral health.',
    },
    'vto5s2ga': {
      'es': 'Profesionales  ',
      'en': 'Professionals',
    },
    'jouqvyqb': {
      'es': 'Inicio',
      'en': 'home',
    },
  },
  // Convenios
  {
    'dj711e1h': {
      'es': 'Asociaciones con NISI',
      'en': 'Partnerships with NISI',
    },
    '350ussw7': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Contactanos
  {
    's4t2883c': {
      'es': 'Informacion de contacto',
      'en': 'Contact information',
    },
    'j65ignz8': {
      'es':
          'Estamos aquí para responder a todas tus preguntas y brindarte la mejor atención dental. Si necesitas agendar una cita, resolver dudas o simplemente quieres obtener más información sobre nuestros servicios, no dudes en ponerte en contacto con nosotros.',
      'en':
          'We are here to answer all your questions and provide you with the best dental care. If you need to schedule an appointment, answer questions or simply want to obtain more information about our services, do not hesitate to contact us.',
    },
    'fg5fcmwh': {
      'es': 'Correo:',
      'en': 'Mail:',
    },
    'kj4z5o9h': {
      'es': 'clinicanisidental@gmail.com',
      'en': 'dennisqs@gmail.com',
    },
    'za0ng77h': {
      'es': 'Telefono:',
      'en': 'Phone:',
    },
    'vot51ze7': {
      'es': '(506) 2262-1052',
      'en': '(506) 2262-1052',
    },
    'ga5ocpqx': {
      'es': 'Dirección:',
      'en': 'Address:',
    },
    'abyzokem': {
      'es':
          '100 metros sur, 50 metros oeste del Centro Comercial Multiflores, San Francisco de Heredia, Heredia, Costa Rica.',
      'en':
          '100 meters south, 50 meters west of the Multiflores Shopping Center, San Francisco de Heredia, Heredia, Costa Rica.',
    },
    'fev7stbd': {
      'es': 'Horarios:',
      'en': 'Schedules:',
    },
    'e77untdw': {
      'es':
          'Lunea a Viernes | 9:00 am a 5:00 pm\nSabados | 9:00 am a 12 : 00 md',
      'en':
          'Monday to Friday | 9:00 a.m. to 5:00 p.m.\nSaturdays | 9:00 am to 12:00 pm',
    },
    'lot04cad': {
      'es': 'Redes Sociales',
      'en': 'Social networks',
    },
    'iqysxikb': {
      'es': 'Contactanos ',
      'en': 'Contact us',
    },
  },
  // Services
  {
    'ejjs7c27': {
      'es': 'NISI',
      'en': 'NISI',
    },
    'jeo1pfze': {
      'es': 'Limpieza Dental',
      'en': 'Dental cleaning',
    },
    'qp8au14o': {
      'es': 'Extracción',
      'en': 'Extraction',
    },
    'p1fk6hkm': {
      'es': 'Blanqueamiento',
      'en': 'Whitening',
    },
    'abbv63qk': {
      'es': 'Tratamiento de nervio',
      'en': 'nerve treatment',
    },
    'bojgi3bu': {
      'es': 'Puentes',
      'en': 'Bridges',
    },
    'vsky2fgh': {
      'es': 'Coronas',
      'en': 'Crowns',
    },
    'nq5j63wa': {
      'es': 'Prótesis parciales removibles',
      'en': 'Removable partial dentures',
    },
    'pnv51rjo': {
      'es': 'Cirugías',
      'en': 'Surgeries',
    },
    '58v0rru1': {
      'es': 'Ortodoncia',
      'en': 'Orthodontics',
    },
    'eaxd3w8k': {
      'es': 'Implantes Dentales',
      'en': 'Dental implants',
    },
    '8yw2pwke': {
      'es': 'Estética',
      'en': 'Esthetic',
    },
    '84jv7c5u': {
      'es': 'Servicios',
      'en': 'Services',
    },
    'ot223boz': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // PreguntasFrecuentes
  {
    'hpfi8s8k': {
      'es': '¿Cuantas veces al día debemos cepillarnos?',
      'en': 'How many times a day should we brush?',
    },
    'bya3cau1': {
      'es':
          'Es fundamental cepillarse al menos dos veces por día los dientes. Si se puede más, mejor. Busca siempre pastas dentales con fluoruro.',
      'en':
          'It is essential to brush your teeth at least twice a day. If more is possible, even better. Always look for toothpastes with fluoride.',
    },
    'om8lh3zh': {
      'es': '¿Se puede compartir el cepillo de dientes?',
      'en': 'Can the toothbrush be shared?',
    },
    '4mnz70up': {
      'es':
          'No es bueno compartir el cepillo de dientes. Esto puede lograr que tú te contagies alguna infección bucal.',
      'en':
          'It is not good to share the toothbrush. This can cause you to get an oral infection.',
    },
    '9mvq8w08': {
      'es': '¿Como puedo desinfectar mi cepillo de dientes?',
      'en': 'How can I disinfect my toothbrush?',
    },
    'wctmsngw': {
      'es':
          '¡No lo hagas! No limpies tu cepillo en soluciones desinfectantes, enjuagues bucales, lava vajillas, dispositivos de microondas para desinfectar o rayos ultravioleta.',
      'en':
          'Do not do it! Do not clean your brush in disinfectant solutions, mouthwashes, dishwashers, microwave disinfection devices, or ultraviolet rays.',
    },
    '4ogrpdcj': {
      'es': '¿cada cuanto debo cambiar mi cepillo de dientes?',
      'en': 'How often should I change my toothbrush?',
    },
    'bi2zqkol': {
      'es':
          'Cada 3 ó 4 meses debes cambiar tu cepillo. Antes si tú vez que tiene las puntas de las cerdas gastadas o dobladas.',
      'en':
          'Every 3 or 4 months must change your brush. Before you see that the tips of the bristles are worn or bent.',
    },
    'pxz2qh7k': {
      'es': '¿Cada cuato utilizar el hilo dental?',
      'en': 'Does everyone use dental floss?',
    },
    'r8ol986h': {
      'es':
          'Es fundamental. Debes usarlo a diario. Busca hilos dentales aprobados por la Academia Dental Americana (ADA).',
      'en':
          'It\'s fundamental. You must use it daily. Look for dental flosses approved by the American Dental Academy (ADA).',
    },
    'imtojwep': {
      'es': 'Preguntas Frecuentes',
      'en': 'Frequent questions',
    },
    'kxg2eitq': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ResenaClientes
  {
    'wflp8m7i': {
      'es':
          '\"Me encantó la atención de el. Yo le tengo horror al dentista y el doc me trato de maravilla.Super recomendado\"',
      'en':
          '\"I loved his attention. I hate the dentist and the doctor treated me wonderfully. Super recommended\"',
    },
    'tbwk3dba': {
      'es': 'Ale Alvarado Soto',
      'en': 'Ale Alvarado Soto',
    },
    'iokdaayf': {
      'es': '\"Exelente la atención recibida, muy profesionales\"',
      'en': '\"Excellent service received, very professional\"',
    },
    '3hdrhhr9': {
      'es': 'Zaida Romero',
      'en': 'Zaida Romero',
    },
    'sgamlu6x': {
      'es':
          '\"La verdad son muy buenos en lo que hacen, excelente trato y atencion\"',
      'en':
          '\"The truth is they are very good at what they do, excellent treatment and attention\"',
    },
    'yjh2yhii': {
      'es': 'Alejandra Mendoza',
      'en': 'Alejandra Mendoza',
    },
    'qx6hx0j7': {
      'es':
          '\"Recomendados. Carisma, profesionalismo y excelente comunicación\"',
      'en':
          '\"Recommended. Charisma, professionalism and excellent communication\"',
    },
    'xrafq7ha': {
      'es': 'Oscar Aguilar Aguero',
      'en': 'Oscar Aguilar Aguero',
    },
    '5li95gtb': {
      'es': '\" Cien por cieno recomendados, excelente atencion\"',
      'en': '\"One hundred percent recommended, excellent service\"',
    },
    'y6zyg2fl': {
      'es': 'Alejandra Mendoza',
      'en': 'Alejandra Mendoza',
    },
    'ptjqaaxj': {
      'es':
          '\"Son los mejores, los recomienbdo al 100 %, están en San Frascisco de Heredia.\"',
      'en':
          '\"They are the best, I recommend them 100%, they are in San Frascisco de Heredia.\"',
    },
    '8glc1nrl': {
      'es': 'Marianela Castro',
      'en': 'Marianela Castro',
    },
    'sxdccqb8': {
      'es': 'Reseña de Clientes',
      'en': 'Customer Review',
    },
    'ioysdyz6': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Galeria
  {
    'f73v5m14': {
      'es': 'Galeria NISI',
      'en': 'NISI Gallery',
    },
    '9igvfbuh': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // CostosTratamientos
  {
    '64nt7lec': {
      'es': 'Extracción',
      'en': 'Extraction',
    },
    'd3ga94qt': {
      'es': 'Precio: ₡ 25.000',
      'en': 'Price: ₡25,000',
    },
    'guuez0gp': {
      'es': 'Calza Dental ',
      'en': 'Dental Shoe',
    },
    'eoelhyam': {
      'es': 'Precio: ₡ 95.000',
      'en': 'Price: ₡ 95,000',
    },
    'klp3pp02': {
      'es': 'Implante ',
      'en': 'Implant',
    },
    'vzc9c8pq': {
      'es': 'Precio: ₡ 35.000',
      'en': 'Price: ₡ 35,000',
    },
    'rwytwa11': {
      'es': 'Protesis',
      'en': 'Prosthesis',
    },
    '1p75u21a': {
      'es': 'Precio: ₡ 80.000',
      'en': 'Price: ₡80,000',
    },
    'lts6a2m2': {
      'es': 'Corona',
      'en': 'Crown',
    },
    'r2370zw6': {
      'es': 'Precio: ₡ 70.000',
      'en': 'Price: ₡70,000',
    },
    '9859emn8': {
      'es': 'Limpieza',
      'en': 'Cleaning',
    },
    '1uuuji9m': {
      'es': 'Precio: ₡ 20.000',
      'en': 'Price: ₡20,000',
    },
    'ezbxy39w': {
      'es': 'Costo de Tratamientos',
      'en': 'Treatment Cost',
    },
    'h7xyn7fb': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // RegistrosMaterialesMedicos
  {
    '7mopz7f6': {
      'es': 'Elige un material',
      'en': 'Choose a material',
    },
    'nb83kxv6': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    'xehl9d2y': {
      'es': 'Seleccione producto',
      'en': 'Please select...',
    },
    'bvmxv3mh': {
      'es': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'yzg7u2j4': {
      'es': 'Elige una cantidad',
      'en': 'Choose a quantity',
    },
    'tq1hg68b': {
      'es': 'Ingrese cantidad',
      'en': '',
    },
    '2zb3yuyo': {
      'es': 'Operacion',
      'en': 'Operation',
    },
    'bszoh4nl': {
      'es': 'Agregar',
      'en': 'Add',
    },
    '4um6cb9s': {
      'es': 'Agregar',
      'en': 'Add',
    },
    'eb3tscpu': {
      'es': 'Quitar',
      'en': 'Subtract',
    },
    '3ahbq3t9': {
      'es': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '7uquarvp': {
      'es': 'Registrar',
      'en': 'to register',
    },
    '8eyfu6p5': {
      'es': 'Inventario',
      'en': 'to register',
    },
    '5mbj1fii': {
      'es': ' Registro materiales médicos',
      'en': 'Registration of medical materials',
    },
    'hbh0ek79': {
      'es': 'Registo Materiales',
      'en': 'Materials Registry',
    },
  },
  // homePage
  {
    '522jy0c2': {
      'es': '¡Bienvenido a NISI!',
      'en': 'Welcome to NISI!',
    },
    'zlgva42u': {
      'es':
          'En nuestra clínica, nos esforzamos por brindar un servicio de alta calidad en un entorno acogedor y amigable.',
      'en':
          'At our clinic, we strive to provide high-quality service in a welcoming and friendly environment.',
    },
    'i91uzfkt': {
      'es': 'Agendar Cita',
      'en': 'Schedule Appointment',
    },
    'fxb6d5zo': {
      'es': 'Contactanos',
      'en': 'Contact us',
    },
    'heoamgfk': {
      'es': 'Nosotros',
      'en': 'Us',
    },
    '7644adzs': {
      'es': 'Servicios',
      'en': 'Services',
    },
    'mk5t81du': {
      'es': 'Costos tratamientos',
      'en': 'Treatment costs',
    },
    'qnwyxjpn': {
      'es': 'Convenios',
      'en': 'Agreements',
    },
    'pkxx4wlw': {
      'es': 'Galería',
      'en': 'Gallery',
    },
    'dhz9lcu4': {
      'es': 'Preguntas Frecuentes',
      'en': 'Frequent questions',
    },
    'lc6bsoqf': {
      'es': 'Reseñas',
      'en': 'Reviews',
    },
    '59m6tiyp': {
      'es': 'Admin',
      'en': 'Admin',
    },
    'zxxgrgcs': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // agregar_datos_admin_doctores
  {
    'd03zbpu1': {
      'es': 'Agregar nombre de nuevo medico:',
      'en': 'Add new doctor name:',
    },
    'msa6i2nb': {
      'es': 'Registrar',
      'en': 'Register',
    },
    'gqrc297a': {
      'es': 'Borrar',
      'en': 'Delete',
    },
    'cf7mfacm': {
      'es': 'Agregar datos administrador',
      'en': 'Add administrator data',
    },
    '341o9vn4': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // MaterialesMedicos
  {
    'cir85g4b': {
      'es': 'Materiales médicos',
      'en': 'medical materials',
    },
    'ulcnspy1': {
      'es': 'Materiales',
      'en': 'Materials',
    },
  },
  // agregar_datos_tratamientos
  {
    'd62ccegg': {
      'es': 'Agregar nombre de nuevo tratamientos:',
      'en': 'Add name of new treatments:',
    },
    'k0y3f45x': {
      'es': 'Registrar',
      'en': 'Register',
    },
    'bnef44vd': {
      'es': 'Borrar',
      'en': 'Delete',
    },
    'bur8rum2': {
      'es': 'Agregar datos administrador',
      'en': 'Add administrator data',
    },
    's8e8fb33': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Menu_Administrador
  {
    'zhbfg3yv': {
      'es': 'Ver cuentas generadas',
      'en': 'Add doctor',
    },
    '9dgwc7qv': {
      'es': 'Agregar doctor',
      'en': 'Add doctor',
    },
    'us80wlax': {
      'es': 'Agregar Tratamiento',
      'en': 'Add Treatment',
    },
    'd0yni10d': {
      'es': 'Historial General de Citas ',
      'en': 'Add Treatment',
    },
    'h8ds15o9': {
      'es': 'Registro de Materiales Medicos',
      'en': 'Add Treatment',
    },
    'oqeohpqn': {
      'es': 'Exportar a PDF',
      'en': 'Add Treatment',
    },
    'jhmgrnoo': {
      'es': 'Modulo administracion',
      'en': 'Page Title',
    },
    '8m7ubwd3': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Promociones
  {
    'v7dnofh0': {
      'es': 'Promociones',
      'en': 'Promotions',
    },
    'p9xufx9j': {
      'es': 'Al agendar tu segunda cita recibiras un 15% de descuento.',
      'en':
          'When you schedule your second appointment you will receive a 15% discount.',
    },
    'w121uxvo': {
      'es': '25% de descuento al realizarte una limpieza + blanquemiento.',
      'en': '25% discount when you have a cleaning + whitening.',
    },
    '7hjj4cfw': {
      'es': '30% de descuento al realizarte un implante dental.',
      'en': '30% discount when you have a dental implant.',
    },
    'z14r2wj4': {
      'es': 'Recibe un 10% de descuento en limpiezas dentales.',
      'en': 'Receive a 10% discount on dental cleanings.',
    },
    '7w99e22z': {
      'es': 'Cupones de descuento*',
      'en': 'Discount coupons*',
    },
    '1yejvkwe': {
      'es':
          'Menciona el codigo Nisi27 para tener un 5% de descuento adicional.',
      'en': 'Mention the code Nisi27 for an additional 5% discount.',
    },
    'f3z1fgyy': {
      'es':
          'Menciona el codigo NavidadNisi para tener un 7% de descuento adicional.',
      'en': 'Mention the code NavidadNisi for an additional 7% discount.',
    },
    'of8nhyj6': {
      'es': 'Promociones y descuentos',
      'en': 'Promotions and discounts',
    },
    'mkwup6ql': {
      'es': 'Promo',
      'en': 'home',
    },
  },
  // TemasImportantes
  {
    'g1f429eo': {
      'es':
          'Servicios Ofrecidos:\n\n\"En nuestra clínica odontológica, ofrecemos una amplia gama de servicios, desde limpiezas dentales y empastes hasta tratamientos de ortodoncia avanzada. Nos especializamos en proporcionar soluciones completas para la salud bucal de nuestros pacientes.\"',
      'en':
          '- The professional team that makes up this clinic is constantly trained in order to provide patients with first-class care.\n\n- We have the latest in X-ray technology.\n\n- Our medical equipment is 100% sterilized by our professionals.\n\n- We like opinions and they help us make decisions, so please feel free to share any opinion or comment with our team and this will help us grow as a family.',
    },
    'y2z3o7xi': {
      'es':
          'Tecnología y Equipamiento:\n\n\"Utilizamos tecnología de vanguardia, como radiografías digitales que reducen la exposición a la radiación, escáneres intraorales para obtener imágenes precisas y sistemas de gestión de pacientes que garantizan una atención eficiente.\"',
      'en':
          '- The professional team that makes up this clinic is constantly trained in order to provide patients with first-class care.\n\n- We have the latest in X-ray technology.\n\n- Our medical equipment is 100% sterilized by our professionals.\n\n- We like opinions and they help us make decisions, so please feel free to share any opinion or comment with our team and this will help us grow as a family.',
    },
    'qbv73euz': {
      'es':
          'Equipo Profesional:\n\n\"Nuestro equipo está formado por odontólogos altamente capacitados, higienistas dentales dedicados y un personal administrativo amable. Nos enorgullece contar con profesionales comprometidos con la excelencia y la atención personalizada.\"',
      'en':
          '- The professional team that makes up this clinic is constantly trained in order to provide patients with first-class care.\n\n- We have the latest in X-ray technology.\n\n- Our medical equipment is 100% sterilized by our professionals.\n\n- We like opinions and they help us make decisions, so please feel free to share any opinion or comment with our team and this will help us grow as a family.',
    },
    'rslrqn74': {
      'es':
          'Educación del Paciente:\n\n\"Ofrecemos materiales educativos, charlas informativas y recordatorios personalizados para ayudar a nuestros pacientes a mantener una buena salud bucal. La educación del paciente es una parte integral de nuestra filosofía de atención.\"',
      'en':
          '- The professional team that makes up this clinic is constantly trained in order to provide patients with first-class care.\n\n- We have the latest in X-ray technology.\n\n- Our medical equipment is 100% sterilized by our professionals.\n\n- We like opinions and they help us make decisions, so please feel free to share any opinion or comment with our team and this will help us grow as a family.',
    },
    'vzjg9stx': {
      'es': 'Temas importantes',
      'en': 'Important topics',
    },
    '0ykc7t8v': {
      'es': 'Info',
      'en': 'home',
    },
  },
  // MetodosDePago
  {
    '29ta4wd5': {
      'es': 'Conoce nuestros metodos de pago y facilidades.',
      'en': 'Mention the code Nisi27 for an additional 5% discount.',
    },
    'vf1yxuab': {
      'es': 'Metodos de pago',
      'en': 'Payment methods',
    },
    'f877xq0l': {
      'es': 'Pago',
      'en': 'home',
    },
  },
  // Cuentas_agregadas_app
  {
    'npudsz72': {
      'es': 'Borrar',
      'en': 'Delete',
    },
    'y7jaxjq2': {
      'es': 'Cuentas agregadas a sistema',
      'en': '',
    },
    '9v3ygltn': {
      'es': 'Home',
      'en': '',
    },
  },
  // recuperarpassword
  {
    'jjtwts1t': {
      'es': 'Olvide mi contraseña',
      'en': '',
    },
    'h0fk1af0': {
      'es': 'Ingrese su correo electronico, para recuperar su contraseña',
      'en': '',
    },
    'p1vsdgh8': {
      'es': 'Email Address',
      'en': '',
    },
    'gpidahst': {
      'es': 'Ingrese su email',
      'en': '',
    },
    'hwtmx52o': {
      'es': 'Restablecer contraseña',
      'en': '',
    },
    'bih0xdi9': {
      'es': 'volver',
      'en': '',
    },
  },
  // specialoffer
  {
    '8650oi1m': {
      'es': 'Oferta Especial!!',
      'en': 'Special offer!!',
    },
    'ulb8tkr1': {
      'es': '#NSM123',
      'en': '#NSM123',
    },
    'ncqnis32': {
      'es':
          ' 20% de descuento en todos nuestros tratamientos con el codigo de la app',
      'en': '20% discount on all our treatments with the app code',
    },
  },
  // Miscellaneous
  {
    'bz2vxj7w': {
      'es': '',
      'en': '',
    },
    'icnfbjy3': {
      'es': '',
      'en': '',
    },
    'tdehh1fh': {
      'es': '',
      'en': '',
    },
    'jd7f7goc': {
      'es': '',
      'en': '',
    },
    'ouz4cc3a': {
      'es': '',
      'en': '',
    },
    'ap97ucfs': {
      'es': '',
      'en': '',
    },
    '8dmh6pg7': {
      'es': '',
      'en': '',
    },
    'j8pvl7pi': {
      'es': '',
      'en': '',
    },
    'gdweuql4': {
      'es': '',
      'en': '',
    },
    'kv9ulwqw': {
      'es': '',
      'en': '',
    },
    'lpds0ts0': {
      'es': '',
      'en': '',
    },
    'sw1mvwan': {
      'es': '',
      'en': '',
    },
    'lr8wuozm': {
      'es': '',
      'en': '',
    },
    'tjco1k5n': {
      'es': '',
      'en': '',
    },
    'sybzkek6': {
      'es': '',
      'en': '',
    },
    '7thp31pq': {
      'es': '',
      'en': '',
    },
    'o2yy3lyn': {
      'es': '',
      'en': '',
    },
    '89eo3ce6': {
      'es': '',
      'en': '',
    },
    'ewlkqw1w': {
      'es': '',
      'en': '',
    },
    'f716yrbt': {
      'es': '',
      'en': '',
    },
    'd8czbw4i': {
      'es': '',
      'en': '',
    },
    'ud0jtm6y': {
      'es': '',
      'en': '',
    },
    'pqscn2j5': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
