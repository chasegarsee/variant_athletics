import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'th'];

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
    String? enText = '',
    String? thText = '',
  }) =>
      [enText, thText][languageIndex] ?? '';

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
  // discover
  {
    'mrdy4n49': {
      'en': 'Variant Athletics',
      'th': '',
    },
    'f1qx849h': {
      'en': 'Featured',
      'th': '',
    },
    'nw0p60he': {
      'en': 'Show All ➔',
      'th': '',
    },
    'ha21fvuq': {
      'en': 'Home',
      'th': '',
    },
  },
  // coach
  {
    '3e1pchjb': {
      'en': 'Home',
      'th': '',
    },
  },
  // profile
  {
    'y18kzkpa': {
      'en': 'Edit Profile',
      'th': '',
    },
    '6r7o0g1m': {
      'en': 'Change Password',
      'th': '',
    },
    'lw93b5fa': {
      'en': 'Notification Settings',
      'th': '',
    },
    'ro3uek1q': {
      'en': 'Log Out',
      'th': '',
    },
  },
  // featured
  {
    'kx8gw9oa': {
      'en': 'Featured',
      'th': '',
    },
    'zaaf6o5v': {
      'en': 'Home',
      'th': '',
    },
  },
  // program
  {
    '3nop43a4': {
      'en': 'Page Title',
      'th': '',
    },
    'mp0vkrm1': {
      'en': 'Home',
      'th': '',
    },
  },
  // Auth2
  {
    'zjv4gze5': {
      'en': 'VARIANT',
      'th': '',
    },
    'p79b78xk': {
      'en': 'Create Account',
      'th': '',
    },
    '9rqw9zo9': {
      'en': 'Create Account',
      'th': '',
    },
    'j2pa6ow9': {
      'en': 'Let\'s get started by filling out the form below.',
      'th': '',
    },
    '89t2t24h': {
      'en': 'Email',
      'th': '',
    },
    '3yqx8p8d': {
      'en': 'Password',
      'th': '',
    },
    '6bwqjvb8': {
      'en': 'Confirm Password',
      'th': '',
    },
    'zgsj8ps0': {
      'en': 'Get Started',
      'th': '',
    },
    'n1q94jtb': {
      'en': 'Or sign up with',
      'th': '',
    },
    '89g3hoio': {
      'en': 'Continue with Google',
      'th': '',
    },
    'b3vsxxpa': {
      'en': 'Continue with Apple',
      'th': '',
    },
    '9ry5mnyr': {
      'en': 'Log In',
      'th': '',
    },
    'xsdne37o': {
      'en': 'Welcome Back',
      'th': '',
    },
    'bnfgtyeo': {
      'en': 'Fill out the information below in order to access your account.',
      'th': '',
    },
    'a3dw2iot': {
      'en': 'Email',
      'th': '',
    },
    'oecvbs1l': {
      'en': 'Password',
      'th': '',
    },
    '6k6jys43': {
      'en': 'Sign In',
      'th': '',
    },
    'y4i42p1z': {
      'en': 'Or sign in with',
      'th': '',
    },
    'ph6l58uv': {
      'en': 'Continue with Google',
      'th': '',
    },
    'mp833r1x': {
      'en': 'Continue with Apple',
      'th': '',
    },
    '0jawxomz': {
      'en': 'Forgot Password?',
      'th': '',
    },
    'akheacts': {
      'en': 'Home',
      'th': '',
    },
  },
  // workout
  {
    's7u359qz': {
      'en': 'Page Title',
      'th': '',
    },
    '5u8orcjc': {
      'en': 'Home',
      'th': '',
    },
  },
  // workoutOverview
  {
    'uz5jj6rj': {
      'en': 'Overview',
      'th': '',
    },
    'oc2ha8h1': {
      'en': 'Start Workout',
      'th': '',
    },
    'axfe0gkj': {
      'en': 'Home',
      'th': '',
    },
  },
  // coachPortal
  {
    'wiji0nfr': {
      'en': 'Programs',
      'th': '',
    },
    'aeso0l14': {
      'en': 'Programs',
      'th': '',
    },
    'yz3j3274': {
      'en': 'edit',
      'th': '',
    },
    'ja8wfmr4': {
      'en': 'Workouts',
      'th': '',
    },
    '0i14yz0y': {
      'en': 'Workouts',
      'th': '',
    },
    'mh8elhho': {
      'en': 'Page Title',
      'th': '',
    },
    'u7n7zyz7': {
      'en': 'Home',
      'th': '',
    },
  },
  // newProgram
  {
    'gmo2cn59': {
      'en': 'New Program',
      'th': '',
    },
    'qg9mki8b': {
      'en': 'Cover Photo',
      'th': '',
    },
    'dl5hnbi5': {
      'en': 'Title',
      'th': '',
    },
    '7qugl50p': {
      'en': 'Description',
      'th': '',
    },
    'dsvzc1s4': {
      'en': 'Duration',
      'th': '',
    },
    '83lol4fu': {
      'en': 'Save',
      'th': '',
    },
    'ewcw49wt': {
      'en': 'Home',
      'th': '',
    },
  },
  // newWorkout
  {
    '9vasxywk': {
      'en': 'Create New Program',
      'th': '',
    },
    'gbck15mg': {
      'en': 'Home',
      'th': '',
    },
  },
  // editProgram
  {
    '38oejfdy': {
      'en': 'Edit Program',
      'th': '',
    },
    'l0bobjsi': {
      'en': 'Cover Photo',
      'th': '',
    },
    'zv2ppwzf': {
      'en': 'Delete',
      'th': '',
    },
    'b0g1f1cy': {
      'en': 'Save',
      'th': '',
    },
    '62dgq4i4': {
      'en': 'Home',
      'th': '',
    },
  },
  // deleteProgramBottomSheet
  {
    'garzgyg4': {
      'en': 'Delete Program',
      'th': '',
    },
    'vz8off1a': {
      'en': 'Cancel',
      'th': '',
    },
  },
  // Miscellaneous
  {
    '0akax9ls': {
      'en': '',
      'th': '',
    },
    'xp08t648': {
      'en': '',
      'th': '',
    },
    '8hslyamu': {
      'en': '',
      'th': '',
    },
    'bt24x4k1': {
      'en': '',
      'th': '',
    },
    '1pyj4yge': {
      'en': '',
      'th': '',
    },
    'tfqatzuu': {
      'en': '',
      'th': '',
    },
    'jpndknps': {
      'en': '',
      'th': '',
    },
    's5da7wxn': {
      'en': '',
      'th': '',
    },
    'kjfk6tyq': {
      'en': '',
      'th': '',
    },
    'rbwskmjr': {
      'en': '',
      'th': '',
    },
    'g98c37ar': {
      'en': '',
      'th': '',
    },
    'oqvlato4': {
      'en': '',
      'th': '',
    },
    'vtyeelcv': {
      'en': '',
      'th': '',
    },
    'vwdqr7b3': {
      'en': '',
      'th': '',
    },
    'g4rcynrj': {
      'en': '',
      'th': '',
    },
    'epm7l173': {
      'en': '',
      'th': '',
    },
    'a40aajlz': {
      'en': '',
      'th': '',
    },
    'lky3kpgs': {
      'en': '',
      'th': '',
    },
    'xc16kaue': {
      'en': '',
      'th': '',
    },
    'a6judhci': {
      'en': '',
      'th': '',
    },
    '2cj63zri': {
      'en': '',
      'th': '',
    },
    'u73ouvz0': {
      'en': '',
      'th': '',
    },
    '1yhusdy9': {
      'en': '',
      'th': '',
    },
  },
].reduce((a, b) => a..addAll(b));
