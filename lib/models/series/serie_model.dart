import 'dart:convert';

import 'package:Uniplus/models/base/base_model.dart';
import 'package:Uniplus/models/series/season_model.dart';

SerieModel movieFromJson(String str) =>
    json.decode(str).map((x) => SerieModel.fromJsonList(x));

class SerieModel extends BaseModel {
  SerieModel({
    originalName,
    firstAirDate,
    name,
    originCountry,
    homepage,
    inProduction,
    numberOfEpisodes,
    numberOfSeasons,
    seasons,
    status,
    tagline,
    type,
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
  })  : _originalName = originalName,
        _firstAirDate = firstAirDate,
        _name = name,
        _originCountry = originCountry,
        _homepage = homepage,
        _inProduction = inProduction,
        _numberOfEpisodes = numberOfEpisodes,
        _numberOfSeasons = numberOfSeasons,
        _seasons = seasons,
        _status = status,
        _tagline = tagline,
        _type = type,
        super(
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
        );

  String _originalName;
  DateTime _firstAirDate;
  String _name;
  List<dynamic> _originCountry;
  String _homepage;
  bool _inProduction;
  int _numberOfEpisodes;
  int _numberOfSeasons;
  List<Seasons> _seasons;
  String _status;
  String _tagline;
  String _type;

  get homepage => this._homepage;

  set homepage(value) => this._homepage = value;

  get inProduction => this._inProduction;

  set inProduction(value) => this._inProduction = value;

  get numberOfEpisodes => this._numberOfEpisodes;

  set numberOfEpisodes(value) => this._numberOfEpisodes = value;

  get numberOfSeasons => this._numberOfSeasons;

  set numberOfSeasons(value) => this._numberOfSeasons = value;

  get seasons => this._seasons;

  set seasons(value) => this._seasons = value;

  get status => this._status;

  set status(value) => this._status = value;

  get tagline => this._tagline;

  set tagline(value) => this._tagline = value;

  get type => this._type;

  set type(value) => this._type = value;

  String get originalName => this._originalName;

  set originalName(String value) => this._originalName = value;

  get firstAirDate => this._firstAirDate;

  set firstAirDate(value) => this._firstAirDate = value;

  get name => this._name;

  set name(value) => this._name = value;

  get originCountry => this._originCountry;

  set originCountry(value) => this._originCountry = value;

  factory SerieModel.fromJsonList(Map<String, dynamic> json) {
    String mediaType = json["media_type"] != null ? json["media_type"] : "tv";

    if (mediaType == "tv" && json["poster_path"] != null) {
      return SerieModel(
        originalName: json["original_name"],
        originCountry: json["origin_country"],
        firstAirDate: json["first_air_date"] != null
            ? DateTime.parse(json["first_air_date"])
            : null,
        name: json["name"],
        homepage: json['homepage'],
        inProduction: json['in_production'],
        numberOfEpisodes: json['number_of_episodes'],
        numberOfSeasons: json['number_of_seasons'],
        seasons: json['seasons'] != null
            ? List<Seasons>.from(
                json["seasons"].map((x) => Seasons.fromJson(x)))
            : null,
        status: json['status'],
        tagline: json['tagline'],
        type: json['type'],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalLanguage: json["original_language"],
        overview: json["overview"],
        popularity:
            json["popularity"] != null ? json["popularity"].toDouble() : null,
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"] != null
            ? json["vote_average"].toDouble()
            : null,
        voteCount: json["vote_count"],
        mediaType: json["media_type"],
      );
    } else {
      return null;
    }
  }
}
