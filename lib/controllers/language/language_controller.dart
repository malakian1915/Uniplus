import 'dart:convert';
import 'dart:io';
import 'package:Uniplus/models/language/language_model.dart';
import 'package:path_provider/path_provider.dart';

class LanguageController {
  LanguageController _instance;

  LanguageController getInstance() {
    if (_instance == null) {
      _instance = new LanguageController();
    }
    return _instance;
  }

  Future<File> abreArquivo() async {
    try {
      final diretorio = await getApplicationDocumentsDirectory();
      return File("${diretorio.path}/language.json");
    } catch (e) {
      return null;
    }
  }

  Future<String> lerArquivo() async {
    try {
      final file = await abreArquivo();
      if (file == null) return null;
      var result = json.decode(await file.readAsString());
      final languageResponse = LanguageModel.fromJson(result);
      return languageResponse.language;
    } catch (e) {
      return null;
    }
  }

  Future<String> salvarLanguage(String newLanguage) async {
    try {
      Map<String, dynamic> languageMap = Map();
      languageMap["language"] = newLanguage;

      String language = json.encode(languageMap);
      final file = await abreArquivo();
      if (file == null) return null;
      await file.writeAsString(language);
      await lerArquivo();
      return newLanguage;
    } catch (e) {
      return null;
    }
  }

  Future<void> initializeLanguage() async {
    var file = await abreArquivo();

    if (!await file.exists()) {
      await salvarLanguage("en-us");
    } else {
      await lerArquivo();
    }
  }
}
