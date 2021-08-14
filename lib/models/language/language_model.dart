import 'dart:convert';

LanguageModel languageFromJson(String str) =>
    json.decode(str).map((x) => LanguageModel.fromJson(x));

class LanguageModel {
  LanguageModel({language}) {
    _language = language;
  }

  String _language;

  String get language => this._language;

  set language(String value) => this._language = value;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      LanguageModel(language: json["language"]);
}
