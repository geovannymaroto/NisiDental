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
  // Registro
  {
    'q7dt94y4': {
      'es': 'Usuario',
      'en': 'User',
    },
    '36cz5qs6': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'bswhk8ad': {
      'es': 'Ingresar',
      'en': 'Sign In',
    },
    'dwlhnolv': {
      'es': 'Registrar',
      'en': 'Sign Up',
    },
    'shg1uqu8': {
      'es': 'NisiDental',
      'en': 'NisiDental',
    },
    '546w14fs': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Inicio
  {
    'ddqwn694': {
      'es': 'Agendar Cita',
      'en': 'Schedule Appointment',
    },
    'a9ce3zai': {
      'es': 'Ver mi historial',
      'en': 'My History',
    },
    '0pwncik3': {
      'es': 'Salir ',
      'en': 'Sign out',
    },
    '6veklech': {
      'es': 'Administracion',
      'en': 'Administration',
    },
    '6npedqlg': {
      'es': 'Inicio',
      'en': 'Start',
    },
    'c8fgvpj5': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // CrearCita
  {
    'jwdlhu9o': {
      'es': 'Hora',
      'en': 'Doctor',
    },
    '1nvth52m': {
      'es': '10:30',
      'en': '',
    },
    'ai1uaw60': {
      'es': 'Please select...',
      'en': '',
    },
    'ep4ne1zo': {
      'es': 'Search for an item...',
      'en': '',
    },
    '4yshuizr': {
      'es': 'Doctor',
      'en': 'Doctor',
    },
    'exzlq8ja': {
      'es': 'Seleccionar...',
      'en': 'Select...',
    },
    '5egq86nl': {
      'es': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'ills0zat': {
      'es': 'Motivo',
      'en': 'Reason',
    },
    'vocs8wfc': {
      'es': 'Seleccionar...',
      'en': 'Select...',
    },
    'z0deymoq': {
      'es': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'rx9ho7ks': {
      'es': 'Crear Cita',
      'en': 'Create Appointment',
    },
    'thezksjn': {
      'es': 'Volver',
      'en': 'Return',
    },
    '4g7rrhmp': {
      'es': 'Crear Cita',
      'en': 'Create Appointment',
    },
    'ebmxmiyo': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Historial
  {
    'm729603i': {
      'es': 'Ultima Cita',
      'en': 'Last appointment',
    },
    'qoxqoimq': {
      'es': 'Volver\n',
      'en': 'Return',
    },
    'a3vc6ei2': {
      'es': 'Historial',
      'en': 'Record',
    },
    '19yy4ee0': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Profesionales
  {
    '6yg2f9zo': {
      'es': '            NISI Dental',
      'en': 'NISI Dental',
    },
    'sx5rbj4h': {
      'es': 'Bio',
      'en': 'Bio',
    },
    'r1822ead': {
      'es':
          'Brinda el más cálido servicio en Odontología  de mano de altos profesionales, con equipos de alta tecnología, y excelentes instalaciones.\n\nNuestro equipo de profesionales con grandes capacidades y conocimientos en el campo de la salud dental está a su más atenta disposición.',
      'en':
          'It provides the warmest service in Dentistry by senior professionals, with high-tech equipment, and excellent facilities.\n\nOur team of professionals with great skills and knowledge in the field of dental health is at your most attentive disposal.',
    },
    'eptfozdt': {
      'es': 'Dr.Dennis Quintero',
      'en': 'Dr. Dennis Quintero',
    },
    'qy58vasw': {
      'es':
          '- Conferencista nacional e internacional.\n- Gold Member Style Italiano Endodontics\n- Especialista Salvando Dientes\n',
      'en':
          '- National and international speaker.\n- Gold Member Style Italiano Endodontics\n- Teeth Saving Specialist',
    },
    '09nhwyjx': {
      'es':
          'El Dr.  Dennis, cofundador de NISI Dental, profesional apasionado por la odontología.\n\nSu compromiso con la salud bucal contribuye al bienestar integral de quienes confían en su experiencia y dedicación.',
      'en':
          'Dr. Dennis, co-founder of NISI Dental, professional with a passion for dentistry.\n\nTheir commitment to oral health contributes to the comprehensive well-being of those who trust in their experience and dedication.',
    },
    'ro5zsy5l': {
      'es': 'Dr. Jason Quintero',
      'en': 'Dr. Jason Quintero',
    },
    'r252ytv7': {
      'es':
          '-Odontologo general\n-Se especializa en tratamiento de alineadores',
      'en': '-General dentist\n-Specializes in aligner treatment',
    },
    '4ii1a9ut': {
      'es':
          'El Dr.  Jason, cofundador de NISI Dental.\nEl profesional en odontología, más allá de ser un experto en técnicas y procedimientos, es un cuidador dedicado que valora la importancia de una sonrisa saludable en la calidad de vida.',
      'en':
          'Dr. Jason, co-founder of NISI Dental.\nThe dental professional, beyond being an expert in techniques and procedures, is a dedicated caregiver who values ​​the importance of a healthy smile in the quality of life.',
    },
    '2frlfq4f': {
      'es': 'Raquel Madrigal',
      'en': 'Raquel Madrigal',
    },
    'iklkx1rj': {
      'es': 'Asistente en NISI',
      'en': 'Assistant at NISI',
    },
    'n7xcu57d': {
      'es':
          'Es asistente de NISI desde hace 5 años, nos brinda  el funcionamiento eficiente y acogedor de la práctica odontológica. Su destreza administrativa y habilidades interpersonales hacen que la experiencia del paciente sea fluida y cómoda desde el momento en que ingresan por la puerta.',
      'en':
          'He has been an NISI assistant for 5 years, providing us with the efficient and welcoming operation of the dental practice. Her administrative prowess and interpersonal skills make the patient experience seamless and comfortable from the moment they walk in the door.',
    },
    'lfm9mlxs': {
      'es': 'Angie León',
      'en': 'Angie Leon',
    },
    '13lwfx2m': {
      'es': 'Asistente en NISI',
      'en': 'Assistant at NISI',
    },
    'fwnfzae1': {
      'es':
          'Es asistente en NISI desde hace 8 años no solo es la experta en logística detrás de escena, sino también la sonrisa amigable que da la bienvenida y guía a los pacientes en su viaje hacia una salud bucal óptima.',
      'en':
          'An assistant at NISI for 8 years, she is not only the behind-the-scenes logistics expert, but also the friendly smile that welcomes and guides patients on their journey to optimal oral health.',
    },
    'j59jh0ao': {
      'es': 'Profesionales  ',
      'en': 'Professionals',
    },
    'iugm6g7i': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Convenios
  {
    'mo2obmxw': {
      'es': 'Asociaciones con NISI',
      'en': 'Partnerships with NISI',
    },
    '7dn46o3u': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Contactanos
  {
    'o2ujcyok': {
      'es': 'Informacion de contacto',
      'en': 'Contact information',
    },
    'pu65el4g': {
      'es':
          'Estamos aquí para responder a todas tus preguntas y brindarte la mejor atención dental. Si necesitas agendar una cita, resolver dudas o simplemente quieres obtener más información sobre nuestros servicios, no dudes en ponerte en contacto con nosotros.',
      'en':
          'We are here to answer all your questions and provide you with the best dental care. If you need to schedule an appointment, answer questions or simply want to obtain more information about our services, do not hesitate to contact us.',
    },
    'y2s5z7qc': {
      'es': 'Correo:',
      'en': 'Mail:',
    },
    '5yfd3fb6': {
      'es': 'dennisqs@gmail.com',
      'en': 'dennisqs@gmail.com',
    },
    's1j97ly7': {
      'es': 'Telefono:',
      'en': 'Phone:',
    },
    'gku54qi6': {
      'es': '(506) 2262-1052',
      'en': '(506) 2262-1052',
    },
    'jf3ewsqv': {
      'es': 'Dirección:',
      'en': 'Address:',
    },
    'ipbt7mo1': {
      'es':
          '100 metros sur, 50 metros oeste del Centro Comercial Multiflores, San Francisco de Heredia, Heredia, Costa Rica.',
      'en':
          '100 meters south, 50 meters west of the Multiflores Shopping Center, San Francisco de Heredia, Heredia, Costa Rica.',
    },
    'pkb0u02a': {
      'es': 'Horarios:',
      'en': 'Schedules:',
    },
    'nsb0933h': {
      'es':
          'Lunea a Viernes | 9:00 am a 5:00 pm\nSabados | 9:00 am a 12 : 00 md',
      'en':
          'Monday to Friday | 9:00 a.m. to 5:00 p.m.\nSaturdays | 9:00 am to 12:00 pm',
    },
    'yte4jcp3': {
      'es': 'Redes Sociales',
      'en': 'Social networks',
    },
    'c9xmmbs3': {
      'es': 'Contactanos ',
      'en': 'Contact us',
    },
  },
  // Services
  {
    '366cqy6h': {
      'es': 'NISI',
      'en': 'NISI',
    },
    'v4dt9apt': {
      'es': 'Limpieza Dental',
      'en': 'Dental cleaning',
    },
    'u7b9guh4': {
      'es': 'Extracción',
      'en': 'Extraction',
    },
    '6qtmphx7': {
      'es': 'Blanqueamiento',
      'en': 'Whitening',
    },
    'v0nh6swm': {
      'es': 'Tratamiento de nervio',
      'en': 'nerve treatment',
    },
    'a2ititqb': {
      'es': 'Puentes',
      'en': 'Bridges',
    },
    'om13x33a': {
      'es': 'Coronas',
      'en': 'Crowns',
    },
    '1chmivv5': {
      'es': 'Prótesis parciales removibles',
      'en': 'Removable partial dentures',
    },
    '8wnuf36p': {
      'es': 'Cirugías',
      'en': 'Surgeries',
    },
    '988p6jph': {
      'es': 'Ortodoncia',
      'en': 'Orthodontics',
    },
    'x3u8jv70': {
      'es': 'Implantes Dentales',
      'en': 'Dental implants',
    },
    'g4mwgjgy': {
      'es': 'Estética',
      'en': 'Esthetic',
    },
    'hjy99ili': {
      'es': 'Servicios',
      'en': 'Services',
    },
    'vjwks5o0': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // PreguntasFrecuentes
  {
    '35v706vy': {
      'es': '¿Cuantas veces al día debemos cepillarnos?',
      'en': 'How many times a day should we brush?',
    },
    '52r35i7a': {
      'es':
          'Es fundamental cepillarse al menos dos veces por día los dientes. Si se puede más, mejor. Busca siempre pastas dentales con fluoruro.',
      'en':
          'It is essential to brush your teeth at least twice a day. If more is possible, even better. Always look for toothpastes with fluoride.',
    },
    'c33unplr': {
      'es': '¿Se puede compartir el cepillo de dientes?',
      'en': 'Can the toothbrush be shared?',
    },
    'wtzz9mlf': {
      'es':
          'No es bueno compartir el cepillo de dientes. Esto puede lograr que tú te contagies alguna infección bucal.',
      'en':
          'It is not good to share the toothbrush. This can cause you to get an oral infection.',
    },
    'an4zqhwm': {
      'es': '¿Como puedo desinfectar mi cepillo de dientes?',
      'en': 'How can I disinfect my toothbrush?',
    },
    '0dad3krd': {
      'es':
          '¡No lo hagas! No limpies tu cepillo en soluciones desinfectantes, enjuagues bucales, lava vajillas, dispositivos de microondas para desinfectar o rayos ultravioleta.',
      'en':
          'Do not do it! Do not clean your brush in disinfectant solutions, mouthwashes, dishwashers, microwave disinfection devices, or ultraviolet rays.',
    },
    '5sjsyjmg': {
      'es': '¿cada cuanto debo cambiar mi cepillo de dientes?',
      'en': 'How often should I change my toothbrush?',
    },
    'y5wld3rp': {
      'es':
          'Cada 3 ó 4 meses debes cambiar tu cepillo. Antes si tú vez que tiene las puntas de las cerdas gastadas o dobladas.',
      'en':
          'Every 3 or 4 months must change your brush. Before you see that the tips of the bristles are worn or bent.',
    },
    'cm33ahe4': {
      'es': '¿Cada cuato utilizar el hilo dental?',
      'en': 'Does everyone use dental floss?',
    },
    'dtwvtlfk': {
      'es':
          'Es fundamental. Debes usarlo a diario. Busca hilos dentales aprobados por la Academia Dental Americana (ADA).',
      'en':
          'It\'s fundamental. You must use it daily. Look for dental flosses approved by the American Dental Academy (ADA).',
    },
    'ex7ick2q': {
      'es': 'Preguntas Frecuentes',
      'en': 'Frequent questions',
    },
    'o1pr1h2p': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ResenaClientes
  {
    'bsfl0a6k': {
      'es':
          '\"Me encantó la atención de el. Yo le tengo horror al dentista y el doc me trato de maravilla.Super recomendado\"',
      'en':
          '\"I loved his attention. I hate the dentist and the doctor treated me wonderfully. Super recommended\"',
    },
    '79palk6x': {
      'es': 'Ale Alvarado Soto',
      'en': 'Ale Alvarado Soto',
    },
    'h68arkal': {
      'es': '\"Exelente la atención recibida, muy profesionales\"',
      'en': '\"Excellent service received, very professional\"',
    },
    'lxsgbisx': {
      'es': 'Zaida Romero',
      'en': 'Zaida Romero',
    },
    '7wtit33f': {
      'es':
          '\"La verdad son muy buenos en lo que hacen, excelente trato y atencion\"',
      'en':
          '\"The truth is they are very good at what they do, excellent treatment and attention\"',
    },
    'ezdnsmf8': {
      'es': 'Alejandra Mendoza',
      'en': 'Alejandra Mendoza',
    },
    'u6fs8ep8': {
      'es':
          '\"Recomendados. Carisma, profesionalismo y excelente comunicación\"',
      'en':
          '\"Recommended. Charisma, professionalism and excellent communication\"',
    },
    'n660hux0': {
      'es': 'Oscar Aguilar Aguero',
      'en': 'Oscar Aguilar Aguero',
    },
    '16qtkwho': {
      'es': '\" Cien por cieno recomendados, excelente atencion\"',
      'en': '\"One hundred percent recommended, excellent service\"',
    },
    '6jcq4lxn': {
      'es': 'Alejandra Mendoza',
      'en': 'Alejandra Mendoza',
    },
    'mlg8ivl9': {
      'es':
          '\"Son los mejores, los recomienbdo al 100 %, están en San Frascisco de Heredia.\"',
      'en':
          '\"They are the best, I recommend them 100%, they are in San Frascisco de Heredia.\"',
    },
    'fz02cs5q': {
      'es': 'Marianela Castro',
      'en': 'Marianela Castro',
    },
    '7xso5sx5': {
      'es': 'Reseña de Clientes',
      'en': 'Customer Review',
    },
    'vxtlissd': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Galeria
  {
    'euy8kdb9': {
      'es': 'Galeria NISI',
      'en': 'NISI Gallery',
    },
    'st7fkmb6': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // CostosTratamientos
  {
    '1jbkvjdl': {
      'es': 'Extracción',
      'en': 'Extraction',
    },
    '82jh3lut': {
      'es': 'Precio: ₡ 25.000',
      'en': 'Price: ₡25,000',
    },
    'bgiu476n': {
      'es': 'Calza Dental ',
      'en': 'Dental Shoe',
    },
    '4oay2j44': {
      'es': 'Precio: ₡ 95.000',
      'en': 'Price: ₡ 95,000',
    },
    '4hh0tn0i': {
      'es': 'Implante ',
      'en': 'Implant',
    },
    'ugzs5nkn': {
      'es': 'Precio: ₡ 35.000',
      'en': 'Price: ₡ 35,000',
    },
    'na94r58d': {
      'es': 'Protesis',
      'en': 'Prosthesis',
    },
    '9tq35lxn': {
      'es': 'Precio: ₡ 80.000',
      'en': 'Price: ₡80,000',
    },
    '8eiml0du': {
      'es': 'Corona',
      'en': 'Crown',
    },
    'c7bg254r': {
      'es': 'Precio: ₡ 70.000',
      'en': 'Price: ₡70,000',
    },
    '8u15n32u': {
      'es': 'Limpieza',
      'en': 'Cleaning',
    },
    'e6nq6bax': {
      'es': 'Precio: ₡ 20.000',
      'en': 'Price: ₡20,000',
    },
    'h83tsg9a': {
      'es': 'Costo de Tratamientos',
      'en': 'Treatment Cost',
    },
    'to0gmj0c': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // RegistrosMaterialesMedicos
  {
    'jq2zuzuw': {
      'es': '     Registro de materiales médicos',
      'en': 'Registration of medical materials',
    },
    'jxrq97xb': {
      'es': 'Elige un material',
      'en': 'Choose a material',
    },
    'lcwv2twa': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    'z3ak3h4m': {
      'es': 'Eliga un material',
      'en': 'Please select...',
    },
    'rf2nybam': {
      'es': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'rqtzu90p': {
      'es': 'Elige una cantidad',
      'en': 'Choose a quantity',
    },
    'fjqd7v8y': {
      'es': 'Ingrese la cantidad',
      'en': '',
    },
    'l3vtfbly': {
      'es': 'Operacion',
      'en': 'Operation',
    },
    'qm9ynvpp': {
      'es': 'Agregar',
      'en': 'Add',
    },
    'v9ickksj': {
      'es': 'Agregar',
      'en': 'Add',
    },
    '6eky9e9v': {
      'es': 'Quitar',
      'en': 'Subtract',
    },
    'w5iuf3bl': {
      'es': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'eylw72uy': {
      'es': 'Registrar',
      'en': 'to register',
    },
    '5f5l00cu': {
      'es': '',
      'en': 'Materials Registry',
    },
  },
  // homePage
  {
    '58ik4lbo': {
      'es': '¡Bienvenido a NISI!',
      'en': 'Welcome to NISI!',
    },
    '872g6nhr': {
      'es':
          'En nuestra clínica, nos esforzamos por brindar un servicio de alta calidad en un entorno acogedor y amigable.',
      'en':
          'At our clinic, we strive to provide high-quality service in a welcoming and friendly environment.',
    },
    '28rimqoy': {
      'es': 'Agendar Cita',
      'en': 'Schedule Appointment',
    },
    '36l65vne': {
      'es': 'Contactanos',
      'en': 'Contact us',
    },
    'ruf110jh': {
      'es': 'Nosotros',
      'en': 'Us',
    },
    'mbwjeyna': {
      'es': 'Servicios',
      'en': 'Services',
    },
    'fax6brif': {
      'es': 'Costos tratamientos',
      'en': 'Treatment costs',
    },
    '4ws5ju8y': {
      'es': 'Convenios',
      'en': 'Agreements',
    },
    'g39ahmie': {
      'es': 'Galería',
      'en': 'Gallery',
    },
    '8h5wh6pp': {
      'es': 'Preguntas Frecuentes',
      'en': 'Frequent questions',
    },
    'u14inj4o': {
      'es': 'Reseñas',
      'en': 'Reviews',
    },
    'rpmjmqbk': {
      'es': 'Admin',
      'en': 'Admin',
    },
    'c7pjm6ns': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // agregar_datos_admin_doctores
  {
    '8so3yg8y': {
      'es': 'Agregar nombre de nuevo medico:',
      'en': 'Add new doctor name:',
    },
    'bmtt68zz': {
      'es': 'Registrar',
      'en': 'to register',
    },
    '1dmbbocr': {
      'es': 'Borrar',
      'en': 'Delete',
    },
    'gwnoohm5': {
      'es': 'Agregar datos administrador',
      'en': 'Add administrator data',
    },
    'lmub6eft': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // MaterialesMedicos
  {
    'ahfnjuvr': {
      'es': 'Materiales médicos',
      'en': 'medical materials',
    },
    'wbi0md64': {
      'es': 'Materiales',
      'en': 'Materials',
    },
  },
  // agregar_datos_tratamientos
  {
    'qq4cwx3j': {
      'es': 'Agregar nombre de nuevo tratamientos:',
      'en': 'Add name of new treatments:',
    },
    '2gzk47iv': {
      'es': 'Registrar',
      'en': 'to register',
    },
    '488vs7h9': {
      'es': 'Borrar',
      'en': 'Delete',
    },
    'dv72pnsx': {
      'es': 'Agregar datos administrador',
      'en': 'Add administrator data',
    },
    'w8a8sz80': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Menu_Administrador
  {
    '1q5192kk': {
      'es': 'Agregar doctor',
      'en': 'Add doctor',
    },
    'u5ndv8ru': {
      'es': 'Agregar Tratamiento',
      'en': 'Add Treatment',
    },
    '8mej5dba': {
      'es': 'Page Title',
      'en': 'Page Title',
    },
    '0l4pa4ux': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Promociones
  {
    'qafipgxy': {
      'es': 'Promociones',
      'en': 'NISI',
    },
    'b1uqbdcb': {
      'es': 'Al agendar tu segunda cita recibiras un 15% de descuento.',
      'en': 'Bridges',
    },
    '4vcae994': {
      'es': '25% de descuento al realizarte una limpieza + blanquemiento.',
      'en': 'Bridges',
    },
    '8vv1w8ny': {
      'es': '30% de descuento al realizarte un implante dental.',
      'en': 'Bridges',
    },
    '3g5i4qxj': {
      'es': 'Recibe un 10% de descuento en limpiezas dentales.',
      'en': 'Bridges',
    },
    'lfoapy5w': {
      'es': 'Cupones de descuento*',
      'en': 'NISI',
    },
    'fgrwz8rm': {
      'es':
          'Menciona el codigo Nisi27 para tener un 5% de descuento adicional.',
      'en': 'Bridges',
    },
    'rouz899r': {
      'es':
          'Menciona el codigo NavidadNisi para tener un 7% de descuento adicional.',
      'en': 'Bridges',
    },
    'pkgawbpx': {
      'es':
          '*Los cupones pueden ser utilizados solo 1 vez por paciente y no se pueden usar mas de 1 cupon por tratamiento.',
      'en': '',
    },
    'xfsh3mle': {
      'es': 'Promociones y descuentos',
      'en': 'Services',
    },
    'r21ywclf': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // TemasImportantes
  {
    'fpxl2q4p': {
      'es':
          '- El equipo profesional que conforman esta clinica son capacitados constante mente para asi poder brindar a los pacientes una atencion de primer nivel.\n\n- Contamos con lo ultimo en tecnologia en rayos X.\n\n- Nuestros equipos medicos estan 100% esterilizados por nuestros profesionales.\n\n- Las opiniones nos gustan y nos ayudan a tomar decisiones, asi que por favor sentirse libre de compartir cualquier opinion o comentario con nuestro equipo y esto nos ayudara a crecer en familia.',
      'en': 'Bridges',
    },
    'fjwhe869': {
      'es': 'Temas importantes',
      'en': 'Services',
    },
    '4dg1khln': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // MetodosDePago
  {
    '9sv9woly': {
      'es':
          'Menciona el codigo Nisi27 para tener un 5% de descuento adicional.',
      'en': 'Bridges',
    },
    'ch9btxxu': {
      'es':
          'Menciona el codigo NavidadNisi para tener un 7% de descuento adicional.',
      'en': 'Bridges',
    },
    'w462p5n4': {
      'es': 'Metodos de pago',
      'en': 'Services',
    },
    '5jfnpi3a': {
      'es': 'Home',
      'en': 'home',
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
