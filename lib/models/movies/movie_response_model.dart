import 'package:Uniplus/models/movies/movie_model.dart';
import 'dart:convert';

import 'movie_model.dart';

List<MovieResponseModel> popularMoviesFromJson(String str) =>
    List<MovieResponseModel>.from(
        json.decode(str).map((x) => MovieResponseModel.fromJson(x)));

class MovieResponseModel {
  MovieResponseModel({page, totalResults, totalPages, movies}) {
    _page = page;
    _totalResults = totalResults;
    _totalPages = totalPages;
    _movies = movies;
  }

  int _page;
  int _totalResults;
  int _totalPages;
  List<MovieModel> _movies;

  get page => this._page;

  set page(value) => this._page = value;

  get totalResults => this._totalResults;

  set totalResults(value) => this._totalResults = value;

  get totalPages => this._totalPages;

  set totalPages(value) => this._totalPages = value;

  get movies => this._movies;

  set movies(value) => this._movies = value;

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      MovieResponseModel(
          totalResults: json["total_results"],
          totalPages: json["total_pages"],
          page: json["page"],
          movies: List<MovieModel>.from(
              json["results"].map((x) => MovieModel.fromJsonList(x))));
}
