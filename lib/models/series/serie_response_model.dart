import 'package:Uniplus/models/series/serie_model.dart';

class SerieResponseModel {
  SerieResponseModel({page, totalResults, totalPages, series}) {
    _page = page;
    _totalResults = totalResults;
    _totalPages = totalPages;
    _series = series;
  }

  int _page;
  int _totalResults;
  int _totalPages;
  List<SerieModel> _series;

  get page => this._page;

  set page(value) => this._page = value;

  get totalResults => this._totalResults;

  set totalResults(value) => this._totalResults = value;

  get totalPages => this._totalPages;

  set totalPages(value) => this._totalPages = value;

  get series => this._series;

  set series(value) => this._series = value;

  factory SerieResponseModel.fromJson(Map<String, dynamic> json) =>
      SerieResponseModel(
          totalResults: json["total_results"],
          totalPages: json["total_pages"],
          page: json["page"],
          series: List<SerieModel>.from(
              json["results"].map((x) => SerieModel.fromJsonList(x))));
}
