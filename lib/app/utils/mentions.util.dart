// import 'package:eldesk/app/data/models/base.model.dart';

// class MentionHelper {
//   static MentionModel handleContentInputToHtml(String markupText) {
//     String _splitPattern = DateTime.now().microsecondsSinceEpoch.toString();
//     markupText.trim();
//     markupText = markupText.replaceAll("@[__", _splitPattern);
//     markupText = markupText.replaceAll("__)", _splitPattern);
//     markupText = markupText.replaceAll("\n", "<p></p>");
//     var _strings = markupText.split(_splitPattern);
//     var _mention = MentionModel(content: "<p>", userIds: []);
//     for (var string in _strings) {
//       if (string.contains("__]")) {
//         int id = int.parse(string.substring(0, string.indexOf("__]")));
//         _mention.userIds.add(id);
//         //
//         String name = string.substring(string.lastIndexOf("(__") + 3);
//         string =
//             "<span class=\"dx-mention\" spellcheck=\"false\" data-marker=\"@\" "
//             "data-mention-value=\"$name\" data-id=\"$id\">"
//             "﻿<span contenteditable=\"false\"><span>@</span>$name</span>﻿</span>";
//       }
//       _mention.content += string;
//     }
//     _mention.content += "</p>";
//     //
//     return _mention;
//   }
// }
