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
  // HomePage
  {
    'zxkfs3sm': {
      'es': 'Pereira',
      'en': 'Pereira',
    },
    'oghqiy3o': {
      'es': 'Medellin',
      'en': 'Medellin',
    },
    'pam41jef': {
      'es': 'Bogotá',
      'en': 'Bogota',
    },
    'g6qjw9ju': {
      'es': 'Ciudad',
      'en': 'City',
    },
    '3wgae5y3': {
      'es': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'mcm8luzb': {
      'es': 'Recomendaciones',
      'en': 'recommendations',
    },
    'qsis8n17': {
      'es': 'Negocios',
      'en': 'Business',
    },
    'ru343t5w': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'rruchvv0': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // chat
  {
    '0t0s4nrb': {
      'es': 'Hello World',
      'en': 'Hello World',
    },
  },
  // login
  {
    'b3sljuun': {
      'es': 'Inicia Sesión',
      'en': 'Log in',
    },
    'mmuanuxs': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'c5g0tlqr': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'kcr4e50v': {
      'es': 'Inicia Sesión',
      'en': 'Log in',
    },
    'emw77q0z': {
      'es': 'O inicia Sesión con',
      'en': 'Or log in with',
    },
    'jukeezfx': {
      'es': 'Continue with Google',
      'en': 'Continue with Google',
    },
    '7idvr25f': {
      'es': 'Continue with Apple',
      'en': 'Continue with Apple',
    },
    'wgvsw7qx': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Register
  {
    '41a5swci': {
      'es': 'Registrate',
      'en': 'Sign up',
    },
    '0yduewe0': {
      'es': 'Sube tu foto de perfil',
      'en': 'Upload your profile photo',
    },
    '0szqgvk9': {
      'es': 'Nombre',
      'en': 'Name',
    },
    '12j3s77h': {
      'es': 'Telefono',
      'en': 'Phone',
    },
    'z025r3vp': {
      'es': 'Correo',
      'en': 'Mail',
    },
    'o6slyjuo': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'uvzvbtcz': {
      'es': 'COnfirma tu contraseña',
      'en': 'Confirm your password',
    },
    'cdkd3oej': {
      'es': 'Registrate',
      'en': 'Sign up',
    },
    't4nor4ph': {
      'es': '¿Ya tienes cuenta? Inicia sesión',
      'en': 'Do you already have an account? Log in',
    },
    'dql1a6ji': {
      'es': 'O registrate con',
      'en': 'Or register with',
    },
    'bt6zqji6': {
      'es': 'Continue with Google',
      'en': 'Continue with Google',
    },
    'r5rvvgon': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // NewShop
  {
    'qpnsuquv': {
      'es': 'Nuevo Negocio',
      'en': 'New business',
    },
    '9xmqvwq5': {
      'es': 'Logo de tu negocio',
      'en': 'Logo of your business',
    },
    'cxmsorp0': {
      'es': 'Nombre',
      'en': 'Name',
    },
    '56ufqi87': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'ht1ibe6t': {
      'es': 'Restaurante',
      'en': 'Restaurant',
    },
    'asfwe7qd': {
      'es': 'Persona Natural',
      'en': 'Natural person',
    },
    'n1x3qbwj': {
      'es': 'Selecciona el tipo de negocio',
      'en': 'Select the type of business',
    },
    'cp4lsrw3': {
      'es': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '85jcol8p': {
      'es': 'Dirección',
      'en': 'Address',
    },
    'mbekl2o4': {
      'es': 'Registrate',
      'en': 'Sign up',
    },
    'zohrtg6d': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    '9c2xoedd': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // SearchMap
  {
    '6d441xer': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'bbt2rv2a': {
      'es': 'Map',
      'en': 'Map',
    },
  },
  // profile
  {
    'pc2imblw': {
      'es': 'Configuraciones',
      'en': 'Settings',
    },
    'oqif4l2v': {
      'es': 'Configuración de la cuenta',
      'en': 'Account settings',
    },
    '1fs3dovo': {
      'es': 'Administrador',
      'en': 'Administrator',
    },
    'iyrref2w': {
      'es': 'Crear nuevo negocio',
      'en': 'Create new business',
    },
    'nr0jd19e': {
      'es': 'Cerrar sesión',
      'en': 'Sign off',
    },
    'xtgj1ibp': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    '84oigsvk': {
      'es': 'Perfil',
      'en': 'Profile',
    },
  },
  // ModifyUser
  {
    '2gzjan61': {
      'es': 'Mis Datos',
      'en': 'My data',
    },
    '9uoxovmf': {
      'es': 'Modificar',
      'en': 'Modify',
    },
    'p0ore1ej': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'avh5d10i': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // search
  {
    'foe1tio0': {
      'es': 'Negocios...',
      'en': 'Business...',
    },
    '9ejysn9s': {
      'es': 'Comied App',
      'en': 'Comied App',
    },
    'e0k2otdk': {
      'es': 'Buscar',
      'en': 'Look for',
    },
  },
  // profileShop
  {
    'ycnjoloa': {
      'es': 'Contáctanos',
      'en': 'Contact us',
    },
    'vlkdhbs5': {
      'es': 'Dirección',
      'en': 'Address',
    },
    '1ik8gezv': {
      'es': 'Descripción',
      'en': 'Description',
    },
    '0w3e6n94': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    '12ei6tza': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // MyShop
  {
    'ln0o0jia': {
      'es': 'Verificación pendiente',
      'en': 'Pending verification',
    },
    'u49tf46k': {
      'es': 'Verificar',
      'en': 'Verify',
    },
    '9ceean9u': {
      'es': 'Mi tienda',
      'en': 'My shop',
    },
    'q92ieqy8': {
      'es': 'Productos',
      'en': 'Products',
    },
    '3vmcvjf4': {
      'es': 'Anuncios',
      'en': 'Advertisements',
    },
    'fxla6rzl': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'ah2yn3hp': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // MyProducts
  {
    'sc8c8azd': {
      'es': 'Productos',
      'en': 'Products',
    },
    '6bvy0v3g': {
      'es': 'Nuevo Producto',
      'en': 'New product',
    },
    'i467c10l': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    '937cgy6h': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // MYAnuncios
  {
    '0mynqtkf': {
      'es': 'Avisos',
      'en': 'Notices',
    },
    '24efdm42': {
      'es': 'Nuevo Aviso',
      'en': 'New notification',
    },
    'bd3fd1wv': {
      'es': 'Comid App',
      'en': 'Food App',
    },
    'zzuw6n09': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // MapCard
  {
    'zflph9yl': {
      'es': 'Mas información',
      'en': 'More information',
    },
    'oyggxj2p': {
      'es': 'Contáctanos',
      'en': 'Contact us',
    },
  },
  // ProductCreate
  {
    '00tfkas1': {
      'es': 'Nuevo producto',
      'en': 'New product',
    },
    'egf4bcx5': {
      'es': 'Nombre',
      'en': 'Name',
    },
    '1w5y7ec8': {
      'es': 'Nombre',
      'en': 'Name',
    },
    '5geuvqwp': {
      'es': 'Precio',
      'en': 'Price',
    },
    'fpfl0tkn': {
      'es': 'Precio',
      'en': 'Price',
    },
    '46lvv7l3': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'feaknifa': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'o9lknqm0': {
      'es': 'Agregar Producto',
      'en': 'Add Product',
    },
  },
  // AnuncioCreate
  {
    'ojw0l7g9': {
      'es': 'Nuevo Aviso',
      'en': 'New notification',
    },
    '4l7fkdro': {
      'es': 'Nombre',
      'en': 'Name',
    },
    'sqr7yylw': {
      'es': 'Nombre',
      'en': 'Name',
    },
    'wmkbsa7q': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'v2v5jwvi': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'wvs9ht9s': {
      'es': 'Agregar Producto',
      'en': 'Add Product',
    },
  },
  // Miscellaneous
  {
    'if6nu1kp': {
      'es': '',
      'en': '',
    },
    '1c64rc3g': {
      'es': '',
      'en': '',
    },
    'g4ezeoyh': {
      'es': '',
      'en': '',
    },
    'cwk954pc': {
      'es': '',
      'en': '',
    },
    'vu5keuyy': {
      'es': '',
      'en': '',
    },
    'u7y4k4vb': {
      'es': '',
      'en': '',
    },
    'rloszw8w': {
      'es': '',
      'en': '',
    },
    'tjm8e12c': {
      'es': '',
      'en': '',
    },
    'ak1ax5r9': {
      'es': '',
      'en': '',
    },
    '5r22wvlx': {
      'es': '',
      'en': '',
    },
    'lxduigez': {
      'es': '',
      'en': '',
    },
    'min6mibk': {
      'es': '',
      'en': '',
    },
    'z8kveyyg': {
      'es': '',
      'en': '',
    },
    'yqa1j5yd': {
      'es': '',
      'en': '',
    },
    '2nxbhd6o': {
      'es': '',
      'en': '',
    },
    'dz31t275': {
      'es': '',
      'en': '',
    },
    'dhxn29le': {
      'es': '',
      'en': '',
    },
    '2aoyf2bt': {
      'es': '',
      'en': '',
    },
    'm1aau7xt': {
      'es': '',
      'en': '',
    },
    'vwdiylot': {
      'es': '',
      'en': '',
    },
    '08i31qk8': {
      'es': '',
      'en': '',
    },
    's44entp9': {
      'es': '',
      'en': '',
    },
    'ch7bs3be': {
      'es': '',
      'en': '',
    },
    'f5f1gwoe': {
      'es': '',
      'en': '',
    },
    'vgqemi2a': {
      'es': '',
      'en': '',
    },
    'qacm4j5t': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
