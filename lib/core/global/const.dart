import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart';

const String dummyImage = "https://picsum.photos/800";
const String emptyImage =
    "https://assets2.lottiefiles.com/private_files/lf30_e3pteeho.json";
late SharedPreferences globalPrefs;

String appDateFormate(DateTime date, String locale) {
  String pattern = 'yyyy-MM-dd';
  var format = DateFormat(pattern, locale);
  var dateString = format.format(date);
  return dateString;
}

String appTimeFormate(DateTime time, String locale) {
  String pattern = 'HH:mm';
  var format = DateFormat(pattern, locale);
  var timeString = format.format(time);
  return timeString;
}

String timeUntil(DateTime date) {
  timeago.setLocaleMessages("ar", MyCustomMessages());
  return timeago.format(date, allowFromNow: true, locale: "ar");
}

class MyCustomMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'الآن';
  @override
  String aboutAMinute(int minutes) => '$minutesد';
  @override
  String minutes(int minutes) => '$minutesد';
  @override
  String aboutAnHour(int minutes) => '$minutesس';
  @override
  String hours(int hours) => '$hoursساعة';
  @override
  String aDay(int hours) => '$hoursساعات';
  @override
  String days(int days) => '$daysيوم';
  @override
  String aboutAMonth(int days) => '$daysأيام';
  @override
  String months(int months) => '$monthsشهر';
  @override
  String aboutAYear(int year) => '$yearسنة';
  @override
  String years(int years) => '$yearsسنوات';
  @override
  String wordSeparator() => ' ';
}

extension Filter<T> on Stream<List<T>> {
  Stream<List<T>> filter(bool Function(T) where) => map(
        (items) => items.where(where).toList(),
      );
}

const int pageLimit = 10;

class APIKeys {
  static const String apiPassword =
      "drV1DHcwSgFE8ebzBUR523Ym9fo9TGrKFKtPX9xSAEHJ90B7DK";
  static const String sentryKey =
      "https://1ac407eb4ba627696127d12d27921d2c@o4505718997188608.ingest.sentry.io/4505719002103808";
  static const String baseUrl = "https://alaryaf.panorama-g.com/api";
  static const String home = "/home";
  static const String test =
      "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";
  static const String live =
      "mQ7OpLCkjwMB9DSxQP8-W0k81N9f0oiLA6Z4u4hDqUgSdDmeYtg5iO52B_pYkVCMol5D16hQCXiPQjaVY81ovjKE78hfl0x9RuHhdIcLisXXqReKGQBCDotccVR2Mhp1wSrZtBub6WroXNAzc99Qy1tdKOUrbPYGrshRzVyX-Sh-ifICW8W1AEGwmBOVpYlT6K7fdKZ2yxP0tf2ig3ifHBKCm2lHjmaI5t3DeiakftnnU_OZkOvaf47WEN7OZxkWaisKVuz3wSsooUQwIN5NseiC6AaXW3py4AwRHr0JtFbhO_fSTkV9YRgNT7jOBNKeCGJ6Lcs9qYNYxNuDWS7KMi4pulFnm6E2Ceh2_vF5cYpvtnjB2UlInA4wwTasUIaXwTYgKZ2n-FcqIrmAtaU4yfeLQgULWWmyRxTKdYiLyse9jqq-7kETo49nr8i0EZN2sBLATZjCfRL3x1kSMsGML_MAjy_qtHYMR174p8CvfRpS6gZ1v_q-eLcOycCvZcuu21Ik1oF8fSwPEl3sBD7zKzrjKXW6smoFCLLQNHC_M1Os49tjVEI05E7yGME_Lkjbm2t9uOWFooNb994k7uqr4CUAbsCPINj6AtxZdBFCqe4lFDxrg0Tnp5UyVxs-QQnOj5efpSYmJ5kJO26H2ZHSb4Ag6xSsYnoqY-wAo_NXDMmKvtD1ifUMGesA2AE5106mh4Zb9Gk5vZ-4jM2eOuF0FV-zMp531aM4comznH-aSOmUjAv3";
}
