// import 'package:json_annotation/json_annotation.dart';

// class JsonSerializableDateTimeNullable implements JsonConverter<DateTime?, String?> {
//   const JsonSerializableDateTimeNullable();

//   @override
//   DateTime? fromJson(String? json) =>
//       json == null ? null : DateTime.parse(json).toLocal();

//   @override
//   String? toJson(DateTime? date) => date?.toUtc().toIso8601String();
// }

// class JsonSerializableDateTimeRequired implements JsonConverter<DateTime, String> {
//   const JsonSerializableDateTimeRequired();

//   @override
//   DateTime fromJson(String json) => DateTime.parse(json).toLocal();

//   @override
//   String toJson(DateTime date) => date.toUtc().toIso8601String();
// }