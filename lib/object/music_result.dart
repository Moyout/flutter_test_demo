class MusicResult {
  MusicResult({
    int? resultCount,
    List<Results>? results,
  }) {
    _resultCount = resultCount;
    _results = results;
  }

  MusicResult.fromJson(dynamic json) {
    _resultCount = json['resultCount'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }

  int? _resultCount;
  List<Results>? _results;

  MusicResult copyWith({
    int? resultCount,
    List<Results>? results,
  }) =>
      MusicResult(
        resultCount: resultCount ?? _resultCount,
        results: results ?? _results,
      );

  int? get resultCount => _resultCount;

  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resultCount'] = _resultCount;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Results {
  Results({
    String? wrapperType,
    String? kind,
    num? artistId,
    num? collectionId,
    num? trackId,
    String? artistName,
    String? collectionName,
    String? trackName,
    String? collectionCensoredName,
    String? trackCensoredName,
    String? artistViewUrl,
    String? collectionViewUrl,
    String? trackViewUrl,
    String? previewUrl,
    String? artworkUrl30,
    String? artworkUrl60,
    String? artworkUrl100,
    num? collectionPrice,
    num? trackPrice,
    String? releaseDate,
    String? collectionExplicitness,
    String? trackExplicitness,
    num? discCount,
    num? discNumber,
    num? trackCount,
    num? trackNumber,
    num? trackTimeMillis,
    String? country,
    String? currency,
    String? primaryGenreName,
    bool? isStreamable,
    bool isSelected = false,
  }) {
    _wrapperType = wrapperType;
    _kind = kind;
    _artistId = artistId;
    _collectionId = collectionId;
    _trackId = trackId;
    _artistName = artistName;
    _collectionName = collectionName;
    _trackName = trackName;
    _collectionCensoredName = collectionCensoredName;
    _trackCensoredName = trackCensoredName;
    _artistViewUrl = artistViewUrl;
    _collectionViewUrl = collectionViewUrl;
    _trackViewUrl = trackViewUrl;
    _previewUrl = previewUrl;
    _artworkUrl30 = artworkUrl30;
    _artworkUrl60 = artworkUrl60;
    _artworkUrl100 = artworkUrl100;
    _collectionPrice = collectionPrice;
    _trackPrice = trackPrice;
    _releaseDate = releaseDate;
    _collectionExplicitness = collectionExplicitness;
    _trackExplicitness = trackExplicitness;
    _discCount = discCount;
    _discNumber = discNumber;
    _trackCount = trackCount;
    _trackNumber = trackNumber;
    _trackTimeMillis = trackTimeMillis;
    _country = country;
    _currency = currency;
    _primaryGenreName = primaryGenreName;
    _isStreamable = isStreamable;
  }

  Results.fromJson(dynamic json) {
    isSelected = false;
    _wrapperType = json['wrapperType'];
    _kind = json['kind'];
    _artistId = json['artistId'];
    _collectionId = json['collectionId'];
    _trackId = json['trackId'];
    _artistName = json['artistName'];
    _collectionName = json['collectionName'];
    _trackName = json['trackName'];
    _collectionCensoredName = json['collectionCensoredName'];
    _trackCensoredName = json['trackCensoredName'];
    _artistViewUrl = json['artistViewUrl'];
    _collectionViewUrl = json['collectionViewUrl'];
    _trackViewUrl = json['trackViewUrl'];
    _previewUrl = json['previewUrl'];
    _artworkUrl30 = json['artworkUrl30'];
    _artworkUrl60 = json['artworkUrl60'];
    _artworkUrl100 = json['artworkUrl100'];
    _collectionPrice = json['collectionPrice'];
    _trackPrice = json['trackPrice'];
    _releaseDate = json['releaseDate'];
    _collectionExplicitness = json['collectionExplicitness'];
    _trackExplicitness = json['trackExplicitness'];
    _discCount = json['discCount'];
    _discNumber = json['discNumber'];
    _trackCount = json['trackCount'];
    _trackNumber = json['trackNumber'];
    _trackTimeMillis = json['trackTimeMillis'];
    _country = json['country'];
    _currency = json['currency'];
    _primaryGenreName = json['primaryGenreName'];
    _isStreamable = json['isStreamable'];
  }

  String? _wrapperType;
  String? _kind;
  num? _artistId;
  num? _collectionId;
  num? _trackId;
  String? _artistName;
  String? _collectionName;
  String? _trackName;
  String? _collectionCensoredName;
  String? _trackCensoredName;
  String? _artistViewUrl;
  String? _collectionViewUrl;
  String? _trackViewUrl;
  String? _previewUrl;
  String? _artworkUrl30;
  String? _artworkUrl60;
  String? _artworkUrl100;
  num? _collectionPrice;
  num? _trackPrice;
  String? _releaseDate;
  String? _collectionExplicitness;
  String? _trackExplicitness;
  num? _discCount;
  num? _discNumber;
  num? _trackCount;
  num? _trackNumber;
  num? _trackTimeMillis;
  String? _country;
  String? _currency;
  String? _primaryGenreName;
  bool? _isStreamable;
  late bool isSelected;

  Results copyWith({
    String? wrapperType,
    String? kind,
    num? artistId,
    num? collectionId,
    num? trackId,
    String? artistName,
    String? collectionName,
    String? trackName,
    String? collectionCensoredName,
    String? trackCensoredName,
    String? artistViewUrl,
    String? collectionViewUrl,
    String? trackViewUrl,
    String? previewUrl,
    String? artworkUrl30,
    String? artworkUrl60,
    String? artworkUrl100,
    num? collectionPrice,
    num? trackPrice,
    String? releaseDate,
    String? collectionExplicitness,
    String? trackExplicitness,
    num? discCount,
    num? discNumber,
    num? trackCount,
    num? trackNumber,
    num? trackTimeMillis,
    String? country,
    String? currency,
    String? primaryGenreName,
    bool? isStreamable,
  }) =>
      Results(
        wrapperType: wrapperType ?? _wrapperType,
        kind: kind ?? _kind,
        artistId: artistId ?? _artistId,
        collectionId: collectionId ?? _collectionId,
        trackId: trackId ?? _trackId,
        artistName: artistName ?? _artistName,
        collectionName: collectionName ?? _collectionName,
        trackName: trackName ?? _trackName,
        collectionCensoredName: collectionCensoredName ?? _collectionCensoredName,
        trackCensoredName: trackCensoredName ?? _trackCensoredName,
        artistViewUrl: artistViewUrl ?? _artistViewUrl,
        collectionViewUrl: collectionViewUrl ?? _collectionViewUrl,
        trackViewUrl: trackViewUrl ?? _trackViewUrl,
        previewUrl: previewUrl ?? _previewUrl,
        artworkUrl30: artworkUrl30 ?? _artworkUrl30,
        artworkUrl60: artworkUrl60 ?? _artworkUrl60,
        artworkUrl100: artworkUrl100 ?? _artworkUrl100,
        collectionPrice: collectionPrice ?? _collectionPrice,
        trackPrice: trackPrice ?? _trackPrice,
        releaseDate: releaseDate ?? _releaseDate,
        collectionExplicitness: collectionExplicitness ?? _collectionExplicitness,
        trackExplicitness: trackExplicitness ?? _trackExplicitness,
        discCount: discCount ?? _discCount,
        discNumber: discNumber ?? _discNumber,
        trackCount: trackCount ?? _trackCount,
        trackNumber: trackNumber ?? _trackNumber,
        trackTimeMillis: trackTimeMillis ?? _trackTimeMillis,
        country: country ?? _country,
        currency: currency ?? _currency,
        primaryGenreName: primaryGenreName ?? _primaryGenreName,
        isStreamable: isStreamable ?? _isStreamable,
      );

  String? get wrapperType => _wrapperType;

  String? get kind => _kind;

  num? get artistId => _artistId;

  num? get collectionId => _collectionId;

  num? get trackId => _trackId;

  String? get artistName => _artistName;

  String? get collectionName => _collectionName;

  String? get trackName => _trackName;

  String? get collectionCensoredName => _collectionCensoredName;

  String? get trackCensoredName => _trackCensoredName;

  String? get artistViewUrl => _artistViewUrl;

  String? get collectionViewUrl => _collectionViewUrl;

  String? get trackViewUrl => _trackViewUrl;

  String? get previewUrl => _previewUrl;

  String? get artworkUrl30 => _artworkUrl30;

  String? get artworkUrl60 => _artworkUrl60;

  String? get artworkUrl100 => _artworkUrl100;

  num? get collectionPrice => _collectionPrice;

  num? get trackPrice => _trackPrice;

  String? get releaseDate => _releaseDate;

  String? get collectionExplicitness => _collectionExplicitness;

  String? get trackExplicitness => _trackExplicitness;

  num? get discCount => _discCount;

  num? get discNumber => _discNumber;

  num? get trackCount => _trackCount;

  num? get trackNumber => _trackNumber;

  num? get trackTimeMillis => _trackTimeMillis;

  String? get country => _country;

  String? get currency => _currency;

  String? get primaryGenreName => _primaryGenreName;

  bool? get isStreamable => _isStreamable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wrapperType'] = _wrapperType;
    map['kind'] = _kind;
    map['artistId'] = _artistId;
    map['collectionId'] = _collectionId;
    map['trackId'] = _trackId;
    map['artistName'] = _artistName;
    map['collectionName'] = _collectionName;
    map['trackName'] = _trackName;
    map['collectionCensoredName'] = _collectionCensoredName;
    map['trackCensoredName'] = _trackCensoredName;
    map['artistViewUrl'] = _artistViewUrl;
    map['collectionViewUrl'] = _collectionViewUrl;
    map['trackViewUrl'] = _trackViewUrl;
    map['previewUrl'] = _previewUrl;
    map['artworkUrl30'] = _artworkUrl30;
    map['artworkUrl60'] = _artworkUrl60;
    map['artworkUrl100'] = _artworkUrl100;
    map['collectionPrice'] = _collectionPrice;
    map['trackPrice'] = _trackPrice;
    map['releaseDate'] = _releaseDate;
    map['collectionExplicitness'] = _collectionExplicitness;
    map['trackExplicitness'] = _trackExplicitness;
    map['discCount'] = _discCount;
    map['discNumber'] = _discNumber;
    map['trackCount'] = _trackCount;
    map['trackNumber'] = _trackNumber;
    map['trackTimeMillis'] = _trackTimeMillis;
    map['country'] = _country;
    map['currency'] = _currency;
    map['primaryGenreName'] = _primaryGenreName;
    map['isStreamable'] = _isStreamable;
    return map;
  }
}
