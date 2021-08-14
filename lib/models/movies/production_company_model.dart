import 'dart:convert';

List<ProductionCompanyModel> popularMoviesFromJson(String str) =>
    List<ProductionCompanyModel>.from(
        json.decode(str).map((x) => ProductionCompanyModel.fromJson(x)));

class ProductionCompanyModel {
  ProductionCompanyModel({id, logoPath, nome, originCountry}) {
    _id = id;
    _logoPath = logoPath;
    _nome = nome;
    _originCountry = originCountry;
  }

  int _id;
  String _logoPath;
  String _nome;
  String _originCountry;

  get id => this._id;

  set id(value) => this._id = value;

  get logoPath => this._logoPath;

  set logoPath(value) => this._logoPath = value;

  get nome => this._nome;

  set nome(value) => this._nome = value;

  get originCountry => this._originCountry;

  set originCountry(value) => this._originCountry = value;

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      ProductionCompanyModel(
          id: json["id"],
          logoPath: json["logo_path"] == null ? null : json["logo_path"],
          nome: json["name"],
          originCountry: json["origin_country"]);
}
