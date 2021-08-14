import 'package:Uniplus/models/movies/movie_model.dart';
import 'package:Uniplus/models/series/serie_model.dart';

class MovieSerieModel {
  MovieSerieModel({page, totalResults, totalPages, movies, series}) {
    _page = page;
    _totalResults = totalResults;
    _totalPages = totalPages;
    _movies = movies;
    _series = series;
  }

  int _page;
  int _totalResults;
  int _totalPages;
  List<MovieModel> _movies;
  List<SerieModel> _series;

  int get page => this._page;

  set page(int value) => this._page = value;

  get totalResults => this._totalResults;

  set totalResults(value) => this._totalResults = value;

  get totalPages => this._totalPages;

  set totalPages(value) => this._totalPages = value;

  get movies => this._movies;

  set movies(value) => this._movies = value;

  get series => this._series;

  set series(value) => this._series = value;

  factory MovieSerieModel.fromJson(Map<String, dynamic> json) =>
      MovieSerieModel(
          totalResults: json["total_results"],
          totalPages: json["total_pages"],
          page: json["page"],
          movies: List<MovieModel>.from(
              json["results"].map((x) => MovieModel.fromJsonList(x))),
          series: List<SerieModel>.from(
              json["results"].map((x) => SerieModel.fromJsonList(x))));
}
