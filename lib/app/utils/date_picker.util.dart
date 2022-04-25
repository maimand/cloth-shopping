// import 'package:eldesk/app/data/models/base.model.dart';
// import 'package:eldesk/common/widgets/app_date_picker.widget.dart';
// import 'package:get/get.dart';

// class DatePickerUtil {
//   static Future<void> selectDate(
//       {DateTime? initDate,
//       bool disablePrevious = true,
//       bool isSelectedTime = true,
//       required Function(DateTime? picked) onSave}) async {
//     Get.dialog(
//       AppDatePicker(
//         isPickRange: false,
//         disablePrevious: disablePrevious,
//         initEndDate: initDate,
//         isSelectTime: isSelectedTime,
//         onDateSave: onSave,
//       ),
//     );
//   }

//   static Future<DateRangeModel?> selectRangeDate(
//       {DateRangeModel? initRange,
//       required Function(DateRangeModel range) onSave,
//       bool requiredRange = false}) async {
//     Get.dialog(
//       AppDatePicker(
//         isPickRange: true,
//         requiredRange: requiredRange,
//         initEndDate: initRange?.endDate,
//         initStartDate: initRange?.startDate,
//         onRangeSave: onSave,
//       ),
//     );
//   }
// }
