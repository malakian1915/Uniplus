import 'dart:convert';

List<ProductionCountryModel> popularMoviesFromJson(String str) =>
    List<ProductionCountryModel>.from(
        json.decode(str).map((x) => ProductionCountryModel.fromJson(x)));

class ProductionCountryModel {
  ProductionCountryModel({iso31661, nome}) {
    _iso31661 = iso31661;
    _nome = nome;
  }

  String _iso31661;
  String _nome;

  get iso31661 => this._iso31661;

  set iso31661(value) => this._iso31661 = value;

  get nome => this._nome;

  set nome(value) => this._nome = value;

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      ProductionCountryModel(iso31661: json["iso_3166_1"], nome: json["name"]);
}
