// import 'package:eldesk/common/theme/app_colors.dart';
// import 'package:eldesk/generated/locales.g.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:timeago/timeago.dart' as TimeAgo;
// import 'package:get/get.dart';

// import 'package:eldesk/app/enums/enums.dart';

// extension DateTimeExtend on DateTime {
//   String calculateDuration() {
//     final timeSpan = this.difference(DateTime.now());
//     final num totalMin = timeSpan.inMinutes;

//     // 1 day = 1440 min
//     int days = totalMin ~/ 1440;
//     double remainingMinInDay = ((totalMin / 1440) - days) * 1440;
//     int hours = remainingMinInDay ~/ 60;
//     double remainingMinInHour = (remainingMinInDay / 60) - hours;
//     int min = (remainingMinInHour * 60).round();

//     return '$days Days ${hours}h ${min}m';
//   }

//   String timeAgo({String? locale = LanguageEnum.Vietnam}) {
//     if (locale == LanguageEnum.Vietnam) {
//       TimeAgo.setLocaleMessages('vi', TimeAgo.ViMessages());
//     }
//     return TimeAgo.format(this, locale: locale);
//   }

//   String format(
//       {String? displayFormat = "dd/MM/yyyy",
//       String? langCode = LanguageEnum.Vietnam}) {
//     return DateFormat(displayFormat, langCode).format(this);
//   }

//   Color get displayColor {
//     DateTime now = DateTime(
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day,
//       DateTime.now().hour,
//       DateTime.now().minute,
//     );
//     //
//     if (this.isBefore(now) || this == now) return ColorStyles.red.shade600;
//     if (this.day == now.day) return ColorStyles.yellow.shade600;
//     if (this.day == now.day + 1) return ColorStyles.blue.shade600;
//     return ColorStyles.black.shade700;
//   }

//   String get getNameDisplay {
//     DateTime now = DateTime(
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day,
//       DateTime.now().hour,
//       DateTime.now().minute,
//     );
//     //
//     if (this.isBefore(now) || this == now)
//       return this.format(displayFormat: 'dd/MM');
//     if (this.day == now.day) return LocaleKeys.DueDate_Today.tr;
//     if (this.day == now.day + 1) return LocaleKeys.DueDate_Tomorrow.tr;
//     return this.format(displayFormat: 'dd/MM');
//   }

//   bool isSameDate(DateTime other) {
//     return this.year == other.year &&
//         this.month == other.month &&
//         this.day == other.day;
//   }

//   String get dayOfWeekVietnamese {
//     final vietnameseDaysOfWeek = [
//       'Thứ hai',
//       'Thứ ba',
//       'Thứ tư',
//       'Thứ năm',
//       'Thứ sáu',
//       'Thứ bảy',
//       'Chủ nhật'
//     ];
//     return vietnameseDaysOfWeek[this.weekday - 1];
//   }

//   String get dayInWeek {
//     return "DayInWeek_${this.weekday}".tr;
//   }

//   //
//   // Return with yesterday is a special case
//   String specialDateTimeAgo({String? locale = LanguageEnum.Vietnam}) {
//     var diff = DateTime.now().difference(this);
//     if (diff.inDays < 1) {
//       return this.timeAgo(locale: locale);
//     }
//     if (diff.inDays == 1) {
//       return '${LocaleKeys.Reminder_YesterdayAt.tr} ${this.hourMinuteFormat(locale: locale)}';
//     }

//     final date = this.format(displayFormat: 'dd/MM', langCode: locale);
//     final time = this.hourMinuteFormat(locale: locale);

//     return LocaleKeys.Reminder_DateAtTime.trParams(
//         {'date': date, 'time': time});
//   }

//   String hourMinuteFormat({String? locale = LanguageEnum.Vietnam}) {
//     return DateFormat.Hm(locale).format(this);
//   }

// }
