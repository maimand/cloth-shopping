// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:get/get.dart';
// import 'package:open_file/open_file.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:mime/mime.dart';
// import 'package:http_parser/http_parser.dart';

// import 'package:eldesk/common/constants/constants.dart';
// import 'package:eldesk/app/data/models/sale.model.dart';
// import 'package:eldesk/common/utils/file.extension.dart';
// import 'package:eldesk/common/utils/string.extension.dart';

// class FileHelper {
//   static Future<void> launchFile(String url) async {
//     String filePath = '';
//     if (await canLaunch(url)) {
//       FileInfo? fileInfo = await DefaultCacheManager().getFileFromCache(url);
//       if (fileInfo == null) {
//         fileInfo = await DefaultCacheManager().downloadFile(url);
//       }
//       filePath = fileInfo.file.path;
//     } else {
//       filePath = url;
//     }
//     final result = await OpenFile.open(filePath);
//     debugPrint("${result.message}: $url");
//     if (result.type != ResultType.done) {
//       Get.snackbar("Open file", result.message,
//           snackPosition: SnackPosition.BOTTOM, colorText: Colors.redAccent);
//     }
//   }

//   static String getMimeType(String path) {
//     return lookupMimeType(path).toString();
//   }

//   static MediaType getMediaType(File file) {
//     return MediaType.parse(FileHelper.getMimeType(file.path));
//   }

//   static Future<FilePickerResult?> selectFile(
//       {bool allowMultiple = true}) async {
//     Get.focusScope!.unfocus();
//     FilePickerResult? files;
//     await FilePicker.platform
//         .pickFiles(
//           type: FileType.custom,
//           allowedExtensions: EXTENSION_FILE,
//           allowMultiple: allowMultiple,
//         )
//         .then((selectedFiles) => files = selectedFiles);
//     return files;
//   }

//   static Future<List<SaleAttachmentModel>> getSaleAttachmentsFromFileResult(
//       {required FilePickerResult fileResult}) async {
//     List<SaleAttachmentModel> attachments = [];
//     for (var file in fileResult.files) {
//       final content = await file.getMultipartFile();
//       final attachmentFile = SaleAttachmentModel(
//         fileId: file.name,
//         extension: file.name.getExtension,
//         name: file.name,
//         size: file.size,
//         pathFile: file.path,
//         content: content,
//       );
//       attachments.add(attachmentFile);
//     }
//     return attachments;
//   }
// }
