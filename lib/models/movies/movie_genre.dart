import 'dart:convert';

List<MovieGenre> popularMoviesFromJson(String str) =>
    List<MovieGenre>.from(json.decode(str).map((x) => MovieGenre.fromJson(x)));

class MovieGenre {
  MovieGenre({id, nome}) {
    _id = id;
    _nome = nome;
  }

  int _id;
  String _nome;

  get id => this._id;

  set id(int value) => this._id = value;

  get nome => this._nome;

  set nome(value) => this._nome = value;

  factory MovieGenre.fromJson(Map<String, dynamic> json) =>
      MovieGenre(id: json["id"], nome: json["name"]);
}
