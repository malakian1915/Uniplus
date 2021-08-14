import 'package:Uniplus/controllers/language/language_controller.dart';

class RepositoryBase {
  String _languageCode;

  String get languageCode => this._languageCode;

  set languageCode(String value) => this._languageCode = value;

  Future<Map<String, dynamic>> getParameters(
      {int page, int genero, String query}) async {
    var languageCode = await LanguageController().getInstance().lerArquivo();
    languageCode = languageCode ?? null;

    Map<String, dynamic> queryParameters = Map();
    queryParameters["language"] = languageCode.replaceAll("_", "-");
    queryParameters["page"] = page;
    queryParameters["include_adult"] = false;

    if (genero != null) if (genero > 0) queryParameters["with_genres"] = genero;
    if (query != null) queryParameters["query"] = query;

    this.languageCode = languageCode;

    return queryParameters;
  }
}
