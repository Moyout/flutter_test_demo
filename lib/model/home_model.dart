import 'package:flutter_demo/config/api/api.dart';
import 'package:flutter_demo/object/music_result.dart';
import 'package:flutter_demo/utils/sp_util.dart';

class HomeModel {
  MusicResult? _musicResult;
  MusicResult? _original;
  bool _songNameSort = true;

  Future<void> initGetMusicInfo() async {
    var spRes = SpUtil.getObj<MusicResult>("musicResult", (data) => MusicResult.fromJson(data));
    spRes != null ? _musicResult = _original = spRes : await getMusicInfo();
    sortList(songNameSort: _songNameSort);
  }

  Future<void> getMusicInfo({bool showLoading = true}) async {
    var res = await ApiRequest.getSearchResult(count: 200, showLoading: showLoading);
    if (res != null) {
      _musicResult = _original = res;
      sortList(songNameSort: _songNameSort);
      await SpUtil.putObject("musicResult", _musicResult);
    }
  }

  void selectMusic(int index) {
    if (_musicResult?.results?[index].isSelected ?? false) {
      _musicResult?.results?[index].isSelected = false;
      return;
    }
    _musicResult?.results?.forEach((i) {
      i.isSelected = false;
    });
    _musicResult?.results?[index].isSelected = true;
  }

  void searchKey(String key) {
    if (key.isNotEmpty) {
      _musicResult = _original;
      List<Results> filterList = _musicResult?.results?.where((i) {
            return (i.trackName?.toUpperCase().contains(key.toUpperCase()) ?? false) ||
                (i.collectionName?.toUpperCase().contains(key.toUpperCase()) ?? false);
          }).toList() ??
          [];
      _musicResult = MusicResult(results: filterList);
    } else {
      _musicResult = _original;
    }
  }

  sortList({bool songNameSort = true}) {
    _songNameSort = songNameSort;
    _musicResult?.results?.sort((a, b) {
      if (songNameSort) {
        String aTrackName = a.trackName ?? "";
        String bTrackName = b.trackName ?? "";
        if (aTrackName == bTrackName) return 0;
        return aTrackName.compareTo(bTrackName);
      } else {
        String aCollectionName = a.collectionName ?? "";
        String bCollectionName = b.collectionName ?? "";
        if (aCollectionName == bCollectionName) return 0;
        return aCollectionName.compareTo(bCollectionName);
      }
    });
  }

  MusicResult? get musicResult => _musicResult;

  bool get songNameSort => _songNameSort;
}
