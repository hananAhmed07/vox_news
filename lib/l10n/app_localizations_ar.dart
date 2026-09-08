// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get home => 'الرئيسية';

  @override
  String get latestNews => 'أحدث الأخبار';

  @override
  String get categories => 'التصنيفات';

  @override
  String get sources => 'المصادر';

  @override
  String get newsDetails => 'تفاصيل الخبر';

  @override
  String get readFullArticle => 'قراءة المقال كاملًا';

  @override
  String get chooseCategory => 'اختر تصنيفًا';

  @override
  String get englishArabic => 'العربية / English';

  @override
  String get lightDarkMode => 'الوضع الفاتح / الداكن';
}
