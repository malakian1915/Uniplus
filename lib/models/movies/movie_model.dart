import 'dart:convert';

import 'package:Uniplus/models/base/base_model.dart';
import 'package:Uniplus/models/movies/movie_genre.dart';

MovieModel movieFromJson(String str) =>
    json.decode(str).map((x) => MovieModel.fromJson(x));

class MovieModel extends BaseModel {
  MovieModel({
    adult,
    backdropPath,
    genres,
    genreIds,
    id,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    video,
    voteAverage,
    voteCount,
    mediaType,
  })  : _adult = adult,
        _genres = genres,
        _originalTitle = originalTitle,
        _releaseDate = releaseDate,
        _title = title,
        _video = video,
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

  bool _adult;
  List<MovieGenre> _genres;
  String _originalTitle;
  DateTime _releaseDate;
  String _title;
  bool _video;

  get adult => this._adult;

  set adult(value) => this._adult = value;

  get genres => this._genres;

  set genres(value) => this._genres = value;

  get originalTitle => this._originalTitle;

  set originalTitle(value) => this._originalTitle = value;

  get releaseDate => this._releaseDate;

  set releaseDate(value) => this._releaseDate = value;

  get title => this._title;

  set title(value) => this._title = value;

  get video => this._video;

  set video(value) => this._video = value;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genres: List<MovieGenre>.from(
            json["genres"].map((x) => MovieGenre.fromJson(x))),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        mediaType: json["media_type"],
      );

  factory MovieModel.fromJsonList(Map<String, dynamic> json) {
    String mediaType =
        json["media_type"] != null ? json["media_type"] : "movie";

    if (mediaType == "movie" && json["poster_path"] != null) {
      return MovieModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity:
            json["popularity"] != null ? json["popularity"].toDouble() : null,
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] != null
            ? DateTime.parse(json["release_date"])
            : null,
        title: json["title"],
        video: json["video"],
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
