// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart';
// import 'package:dio/dio.dart' as dio;

// import 'package:eldesk/common/utils/file.util.dart';

// extension FileExtend on File {
//   Future<dio.MultipartFile> getMultipartFile() async {
//     return await dio.MultipartFile.fromFile(
//       this.path,
//       filename: basename(this.path),
//       contentType: FileHelper.getMediaType(this),
//     );
//   }
// }

// extension PlatformFileExtend on PlatformFile {
//   Future<dio.MultipartFile> getMultipartFile() async {
//     return await dio.MultipartFile.fromFile(
//       this.path!,
//       filename: basename(this.path!),
//       contentType: FileHelper.getMediaType(File(this.path!)),
//     );
//   }
// }
