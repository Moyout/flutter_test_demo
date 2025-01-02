import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/model/home_model.dart';
import 'package:flutter_demo/object/music_result.dart';
import 'package:flutter_demo/utils/sp_util.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeModel model;

  HomeViewModel({required this.model});

  initGetMusicResult() async {
    await model.initGetMusicInfo();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<void> getMusicResult({bool showLoading = true}) async {
    await model.getMusicInfo(showLoading: showLoading);
    notifyListeners();
  }

  selectMusic(int index) {
    model.selectMusic(index);
    notifyListeners();
  }

  searchKey(String key) {
    model.searchKey(key);
    notifyListeners();
  }

  sortList({bool songNameSort = true}) {
    model.sortList(songNameSort: songNameSort);
    notifyListeners();
  }

  MusicResult? get musicResult => model.musicResult;

  bool get songNameSort => model.songNameSort;

  @override
  void notifyListeners() => super.notifyListeners();
}
