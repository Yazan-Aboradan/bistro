// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'تطبيقنا';

  @override
  String get videos => 'Videos';

  @override
  String get settings => 'إعدادات';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get iDoNotHaveAnAccount => 'I do not have an account';

  @override
  String get welcome => 'مرحبًا';

  @override
  String location_name(Object name) {
    return '$name';
  }

  @override
  String get categories => 'الأصناف';

  @override
  String get lastOrdered => 'الطلبات الأخيرة';

  @override
  String get favorite => 'المفضلة';

  @override
  String get main => 'الرئيسية';

  @override
  String get orders => 'الطلبات';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get showAll => 'عرض الكل';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String tier_type(Object type) {
    return 'العضوية $type';
  }

  @override
  String get points => 'نقاطك';

  @override
  String get golden => 'الذهبية';

  @override
  String get silver => 'الفضية';

  @override
  String get bronze => 'البرونزية';

  @override
  String get tier => 'العضوية';

  @override
  String get help => 'مساعدة';

  @override
  String get customize => 'تعديل إعدادات التطبيق';

  @override
  String get logOut => 'تسجيل خروج';

  @override
  String get scan => 'مسح';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get ago => 'منذ';

  @override
  String get seconds => 'ثوانٍ';

  @override
  String get minutes => 'دقائق';

  @override
  String get hours => 'ساعات';

  @override
  String get days => 'أيام';

  @override
  String get months => 'أشهر';

  @override
  String get years => 'سنوات';

  @override
  String notification_duration(Object number, Object unit) {
    return 'منذ $unit $number';
  }

  @override
  String tap_bar_item_title(Object title) {
    return '$title';
  }

  @override
  String get orderDetails => 'تفاصيل الطلب';

  @override
  String order_number(Object number) {
    return 'الطلب: $number';
  }

  @override
  String order_time(Object time) {
    return 'الوقت: $time';
  }

  @override
  String order_date(Object date) {
    return 'التاريخ: $date';
  }

  @override
  String table_number(Object number) {
    return 'table : $number';
  }

  @override
  String order_table(Object number) {
    return 'الطاولة: $number';
  }

  @override
  String get cash => 'كاش';

  @override
  String payment_method(Object method) {
    return 'طريقة الدفع: $method';
  }

  @override
  String get showMore => 'مشاهدة المزيد...';

  @override
  String get showLess => '...مشاهدة أقل';

  @override
  String total_price(Object price) {
    return 'السعر الإجمالي: $price\$';
  }

  @override
  String get all => 'الكل';

  @override
  String get coldDrinks => 'المشروبات الباردة';

  @override
  String get hotDrinks => 'المشروبات الساخنة';

  @override
  String get desserts => 'الحلويات';

  @override
  String get juices => 'العصائر';

  @override
  String get food => 'الطعام';

  @override
  String get filterBy => 'فلترة بحسب:';

  @override
  String get lastDay => 'آخر يوم';

  @override
  String get lastWeek => 'آخر أسبوع';

  @override
  String get lastMonth => 'آخر شهر';

  @override
  String get lastYear => 'آخر سنة';

  @override
  String get thereAreNoOrdersYet => 'لا توجد طلبات حتى الآن';

  @override
  String get emailOrPhoneNumber => 'البريد الإلكتروني أو رقم الهاتف';

  @override
  String get uDontHaveAnAccount => 'ليس لديك حساب؟';

  @override
  String get password => 'كلمة المرور';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get createAnAccount => 'إنشاء حساب';

  @override
  String get contactUs => 'تواصل معنا';

  @override
  String get cancel => 'إلغاء';

  @override
  String get sure => 'بالتأكيد';

  @override
  String get alreadyHaveAnAccount => 'لديك حساب سابقًا؟';

  @override
  String get logIn => 'تسجيل الدخول';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get verifyPassword => 'تأكيد كلمة المرور';

  @override
  String get userName => 'اسم المستخدم';

  @override
  String get gender => 'الجنس';

  @override
  String get birthDate => 'تاريخ الميلاد';

  @override
  String get applyChanges => 'حفظ التغييرات';

  @override
  String get edit => 'تعديل';

  @override
  String get neww => 'جديد';

  @override
  String get thereAreNoFavoriteProducts => 'لا توجد منتجات مفضلة لديك';

  @override
  String get order => 'الطلب';

  @override
  String get language => 'اللغة';

  @override
  String get agreeFor => 'أوافق على';

  @override
  String get privacy => 'الخصوصية';

  @override
  String get policy => 'الشروط';

  @override
  String get and => 'و';

  @override
  String get visa => 'فيزا';

  @override
  String get bank => 'بنك';

  @override
  String get congratulations => 'تهانينا';

  @override
  String get dispose => 'dispose';

  @override
  String get inValid => 'غير صالح';

  @override
  String congratulations_you_have_gained_points(Object points) {
    return 'تهانينا! لقد حصلت على $points نقطة.';
  }

  @override
  String get areYouSureYouWantToLogOut => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get thanks => 'شكرًا';

  @override
  String get ok => 'حسنًا';

  @override
  String points_have_been_disposed(Object points) {
    return 'تم خصم $points نقطة.';
  }

  @override
  String get thisCodeIsInvValidPleaseTryAgain =>
      'هذا الرمز غير صالح، يرجى المحاولة مرة أخرى.';

  @override
  String get unexpectedErrorOccurred => 'حدث خطأ غير متوقع!';

  @override
  String get error => 'خطأ';

  @override
  String get privacyAndPolicy => 'السياسة والخصوصية';

  @override
  String get brick => 'قرميد';

  @override
  String get resetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get enterYourPhoneNumberConnectedToYourAccount =>
      'أدخل رقم الهاتف المرتبط بحسابك';

  @override
  String get ifThisAccountHasANumberYouWillReceiveACodeOnIt =>
      'إذا كان لديك حساب مرتبط بهذا الرقم، فستتلقى رمز تأكيد. أدخله هنا.';

  @override
  String get enterPassword => 'أدخل كلمة المرور';

  @override
  String get enterPasswordAgain => 'أدخل كلمة المرور مرة أخرى';

  @override
  String get continuee => 'متابعة';

  @override
  String get welcomeEnterYourNumberToContinue =>
      'مرحبًا بك. أدخل رقمك الذي استخدمته عند إنشاء حسابك، رجاءً.';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get games => 'الألعاب';

  @override
  String get socialMedia => ' التواصل الاجتماعي';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get getThePassword => 'الحصول على كلمة المرور';

  @override
  String get next => 'التالي';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get familyName => 'اسم العائلة';

  @override
  String get whatIsYourName => 'ما اسمك؟';

  @override
  String get enterTheNameYouUseInRealLife =>
      'أدخل الاسم الذي تستخدمه في حياتك الواقعية.';

  @override
  String get whatIsYourBirthday => 'ما تاريخ ميلادك؟';

  @override
  String get chooseYourDateOfBirthYouCanScrollDownAndUpToAdjustThat =>
      'يرجى اختيار تاريخ ميلادك عن طريق السحب لأعلى أو لأسفل.';

  @override
  String get month_january => 'يناير';

  @override
  String get month_february => 'فبراير';

  @override
  String get month_march => 'مارس';

  @override
  String get month_april => 'أبريل';

  @override
  String get month_may => 'مايو';

  @override
  String get month_june => 'يونيو';

  @override
  String get month_july => 'يوليو';

  @override
  String get month_august => 'أغسطس';

  @override
  String get month_september => 'سبتمبر';

  @override
  String get month_october => 'أكتوبر';

  @override
  String get month_november => 'نوفمبر';

  @override
  String get month_december => 'ديسمبر';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'أنثى';

  @override
  String get whatIsYourGender => 'ما جنسك؟';

  @override
  String get whatIsYourLanguage => 'ما لغتك؟';

  @override
  String get noteLanguageAndOtherDataCanBeChangedLater =>
      'ملاحظة: جميع المعلومات المدخلة يمكن تعديلها لاحقًا.';

  @override
  String get chooseYourGenderByClickingOn =>
      'اختر جنسك من خلال الضغط على الزر.';

  @override
  String get chooseYourLanguageByClickingOn =>
      'اختر لغتك من خلال الضغط على الزر.';

  @override
  String get whatIsYourPhoneNumber => 'ما رقم هاتفك؟';

  @override
  String get rememberYourPhone =>
      'يرجى تذكّر رقم هاتفك لاستخدامه لاحقًا. اختر رمز الدولة عبر النقر على العلم.';

  @override
  String thanks_name_for_your_time(Object name) {
    return 'شكرًا $name على وقتك.';
  }

  @override
  String get allDataBeenCollectedWillBePrivate =>
      'جميع البيانات التي تم جمعها ستُستخدم فقط لأغراض الإعلانات والتواصل مع العملاء عبر Bistro. ستظل معلوماتك خاصة وآمنة، ولن تتم مشاركتها مع أي طرف خارجي. بالنقر على الزر أدناه، فإنك توافق على استخدام بياناتك وفقًا لذلك.';

  @override
  String get acceptPrivacyAndPolicy => 'أوافق على سياسة الخصوصية';

  @override
  String get accept => 'أوافق';

  @override
  String get create => 'إنشاء من هنا';

  @override
  String get pleaseEnterLongerFirstName => 'أدخل اسمًا أول أطول، رجاءً';

  @override
  String get pleaseEnterLongerLastName => 'أدخل اسم عائلة أطول، رجاءً';

  @override
  String get pleaseEnterAPhoneNumberThatMatchYourSelectedCountry =>
      'أدخل رقم هاتف يتوافق مع البلد المختار';

  @override
  String get pleaseRepeatYourPhoneNumberToVerify => 'كرر رقم الهاتف للتأكيد';

  @override
  String get pleaseOnlyUseOneLanguage => 'استخدم لغة واحدة فقط';

  @override
  String get pleaseOnlyUseOneLanguageForFields =>
      'يرجى استخدام لغة واحدة فقط في الحقول';

  @override
  String get lastName => 'الاسم الأخير';

  @override
  String get pleaseFillINThisField => 'املأ هذا الحقل، رجاءً';

  @override
  String get checkYourNumber => 'تحقق من رقمك';

  @override
  String get noMatchingPhoneNumbers => 'لا يوجد تطابق بين أرقام الهاتف المدخلة';

  @override
  String get pleaseSelectYourGender => 'اختر جنسك';

  @override
  String get pleaseCheckYourSelectedBirthday => 'يرجى التأكد من تاريخ الميلاد';

  @override
  String get verifyPhoneNumber => 'تأكيد رقم الهاتف';

  @override
  String get loginErrorServerSide =>
      'لا يمكن الاتصال بالخادم. يرجى التأكد من أنك متصل بشبكة بيسترو.';

  @override
  String get loginErrorUserSide => 'فشل تسجيل الدخول. تحقق من رقم الهاتف.';

  @override
  String get available => 'متوفر';

  @override
  String get notAvailable => 'غير متوفر';

  @override
  String get ingredients => 'المكونات';

  @override
  String get lengthOfGame => 'مدة اللعبة';

  @override
  String get numberOfPlayers => 'عدد اللاعبين';

  @override
  String get clickForDetails => 'انقر للتفاصيل';

  @override
  String get registerServerSideError =>
      'تعذر الاتصال بالخادم. يرجى التأكد من أنك متصل بشبكة بيسترو.';

  @override
  String get registerUserSideError => 'هذا الرقم محجوز بالفعل.';

  @override
  String get editYourName => 'تعديل الاسم';

  @override
  String get editYourPhoneNumber => 'تعديل رقم الهاتف';

  @override
  String get editYourGender => 'تعديل الجنس';

  @override
  String get editYourBirthday => 'تعديل تاريخ الميلاد';

  @override
  String get syp => 'ل.س';

  @override
  String get expiredDate => 'صالح حتى';
}
