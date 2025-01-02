import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/config/http/base_request.dart';
import 'package:flutter_demo/object/music_result.dart';

class ApiRequest {
  static Future<MusicResult?> getSearchResult({
    String? key = "Talyor+Swift",
    int? count = 200,
    bool showLoading = true,
  }) async {
    var response = await BaseRequest().toGet(
      "/search?term=$key&limit=$count&media=music",
      isShowLoading: showLoading,
    );
    if (response.statusCode == 200) {
      if (response.data.runtimeType == String) {
        var res = jsonDecode(response.data);
        response.data = res;
      }
      var data = MusicResult.fromJson(response.data);
      return data;
    }
    return null;
  }
}
