class BaseModel {
  BaseModel(
    backdropPath,
    genreIds,
    id,
    originalLanguage,
    overview,
    popularity,
    posterPath,
    voteAverage,
    voteCount,
    mediaType,
  ) {
    _backdropPath = backdropPath;
    _genreIds = genreIds;
    _id = id;
    _originalLanguage = originalLanguage;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
    _mediaType = mediaType;
  }

  int _id;
  String _backdropPath;
  List<int> _genreIds;
  int _voteCount;
  double _voteAverage;
  String _overview;
  String _posterPath;
  String _originalLanguage;
  double _popularity;
  String _mediaType;

  get id => this._id;

  set id(value) => this._id = value;

  get backdropPath => this._backdropPath;

  set backdropPath(value) => this._backdropPath = value;

  get genreIds => this._genreIds;

  set genreIds(value) => this._genreIds = value;

  get voteCount => this._voteCount;

  set voteCount(value) => this._voteCount = value;

  get voteAverage => this._voteAverage;

  set voteAverage(value) => this._voteAverage = value;

  get overview => this._overview;

  set overview(value) => this._overview = value;

  get posterPath => this._posterPath;

  set posterPath(value) => this._posterPath = value;

  get originalLanguage => this._originalLanguage;

  set originalLanguage(value) => this._originalLanguage = value;

  get popularity => this._popularity;

  set popularity(value) => this._popularity = value;

  get mediaType => this._mediaType;

  set mediaType(value) => this._mediaType = value;
}
