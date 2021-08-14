class VideosModel {
  String _key;
  String _site;
  String _nome;

  VideosModel({key, site, nome})
      : _key = key,
        _site = site,
        _nome = nome;

  get key => this._key;

  set key(String value) => this._key = value;

  get site => this._site;

  set site(value) => this._site = value;

  String get nome => this._nome;

  set nome(String value) => this._nome = value;

  factory VideosModel.fromJson(Map<String, dynamic> json) {
    String site = json["site"] != null ? json["site"] : "wrong";

    if (site == "YouTube") {
      return VideosModel(
        key: json["key"],
        site: json["site"],
        nome: json["name"],
      );
    } else {
      return null;
    }
  }
}

class VideoModelResponse {
  List<VideosModel> _videos;
  int _contentId;

  VideoModelResponse({contentId, videos})
      : _contentId = contentId,
        _videos = videos;

  get getMovieId => this._contentId;

  set setMovieId(int contentId) => this._contentId = contentId;

  get getVideos => this._videos;

  set setMovieVideos(List<VideosModel> videos) => this._videos = videos;

  factory VideoModelResponse.fromJsonList(Map<String, dynamic> json) {
    return VideoModelResponse(
        contentId: json["id"],
        videos: List<VideosModel>.from(
            json["results"].map((x) => VideosModel.fromJson(x))));
  }
}
