import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class CustomLocalizations {
  CustomLocalizations(this.locale);

  final Locale locale;

  static CustomLocalizations of(BuildContext context) {
    return Localizations.of<CustomLocalizations>(context, CustomLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Title',
      'gotoSecondScreen': 'Go to second screen',
      'yes': 'Yes',
      'no': 'No',
      'confirm': 'Confirm exit app',
      'name': 'Name',
      'fullName': 'Full name',
      'email': 'Email',
      'phone': 'Phone',
      'website': 'Website'
    },
    'ru': {
      'title': 'Заголовок',
      'gotoSecondScreen': 'Перейти ко второму экрану',
      'yes': 'Да',
      'no': 'Нет',
      'confirm': 'Закрыть приложение?',
      'name': 'Имя',
      'fullName': 'Полное имя',
      'email': 'Почта',
      'phone': 'Телефон',
      'website': 'Сайт'
    },
  };

  get title => _localizedValues[locale.languageCode]['title'];

  get goToSecondScreen =>_localizedValues[locale.languageCode]['gotoSecondScreen'];

  get yes =>_localizedValues[locale.languageCode]['yes'];

  get no =>_localizedValues[locale.languageCode]['no'];

  get confirm =>_localizedValues[locale.languageCode]['confirm'];

  get name =>_localizedValues[locale.languageCode]['name'];

  get fullName =>_localizedValues[locale.languageCode]['fullName'];

  get email =>_localizedValues[locale.languageCode]['email'];

  get phone =>_localizedValues[locale.languageCode]['phone'];

  get website =>_localizedValues[locale.languageCode]['website'];

}

class CustomLocalizationsDelegate extends LocalizationsDelegate<CustomLocalizations> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ru'].contains(locale.languageCode);

  @override
  Future<CustomLocalizations> load(Locale locale) {
    return SynchronousFuture<CustomLocalizations>(CustomLocalizations(locale));
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}
