import 'package:Uniplus/models/movies/movie_genre.dart';
import 'package:Uniplus/models/movies/movie_model.dart';
import 'package:Uniplus/models/movies/production_company_model.dart';
import 'package:Uniplus/models/movies/production_country_model.dart';
import 'package:Uniplus/models/movies/spoken_language_model.dart';

import 'dart:convert';

List<MovieDetailModel> popularMoviesFromJson(String str) =>
    List<MovieDetailModel>.from(
        json.decode(str).map((x) => MovieDetailModel.fromJson(x)));

class MovieDetailModel extends MovieModel {
  MovieDetailModel({
    adult,
    backdropPath,
    belongsToCollection,
    budget,
    movieGenres,
    homepage,
    id,
    imdbId,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    productionCompanies,
    productionCountreis,
    releaseDate,
    revenue,
    runtime,
    spokenLanguages,
    status,
    tagline,
    title,
    video,
    voteAverage,
    voteCount,
    mediaType,
  })  : _belongsToCollection = belongsToCollection,
        _budget = budget,
        _homepage = homepage,
        _imdbId = imdbId,
        _productionCompanies = productionCompanies,
        _productionCountreis = productionCountreis,
        _revenue = revenue,
        _runtime = runtime,
        _spokenLanguages = spokenLanguages,
        _status = status,
        _tagline = tagline,
        super(
          adult: adult,
          backdropPath: backdropPath,
          genres: movieGenres,
          genreIds: null,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
          mediaType: mediaType,
        );

  dynamic _belongsToCollection;
  int _budget;
  String _homepage;
  String _imdbId;
  List<ProductionCompanyModel> _productionCompanies;
  List<ProductionCountryModel> _productionCountreis;
  int _revenue;
  int _runtime;
  List<SpokenLanguageModel> _spokenLanguages;
  String _status;
  String _tagline;

  get belongsToCollection => this._belongsToCollection;

  set belongsToCollection(value) => this._belongsToCollection = value;

  get budget => this._budget;

  set budget(value) => this._budget = value;

  get homepage => this._homepage;

  set homepage(value) => this._homepage = value;

  get imdbId => this._imdbId;

  set imdbId(value) => this._imdbId = value;

  get productionCompanies => this._productionCompanies;

  set productionCompanies(value) => this._productionCompanies = value;

  get productionCountreis => this._productionCountreis;

  set productionCountreis(value) => this._productionCountreis = value;

  get revenue => this._revenue;

  set revenue(value) => this._revenue = value;

  get runtime => this._runtime;

  set runtime(value) => this._runtime = value;

  get spokenLanguages => this._spokenLanguages;

  set spokenLanguages(value) => this._spokenLanguages = value;

  get status => this._status;

  set status(value) => this._status = value;

  get tagline => this._tagline;

  set tagline(value) => this._tagline = value;

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        movieGenres: List<MovieGenre>.from(
            json["genres"].map((x) => MovieGenre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["populatiry"].toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompanyModel>.from(
            json["production_companies"]
                .map((x) => ProductionCompanyModel.fromJson(x))),
        productionCountreis: List<ProductionCountryModel>.from(
            json["production_countires"]
                .map((x) => ProductionCountryModel.fromJson(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguageModel>.from(json["spoken_languages"]
            .map((x) => SpokenLanguageModel.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        mediaType: "movie",
      );
}
