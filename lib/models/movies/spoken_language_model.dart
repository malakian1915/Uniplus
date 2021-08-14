import 'dart:convert';

List<SpokenLanguageModel> popularMoviesFromJson(String str) =>
    List<SpokenLanguageModel>.from(
        json.decode(str).map((x) => SpokenLanguageModel.fromJson(x)));

class SpokenLanguageModel {
  SpokenLanguageModel({iso6391, nome}) {
    _iso6391 = iso6391;
    _nome = nome;
  }

  String _iso6391;
  String _nome;

  get iso6391 => this._iso6391;

  set iso6391(String value) => this._iso6391 = value;

  get nome => this._nome;

  set nome(value) => this._nome = value;

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      SpokenLanguageModel(iso6391: json["iso_639_1"], nome: json["name"]);
}
