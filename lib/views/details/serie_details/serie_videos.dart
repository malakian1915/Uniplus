import 'package:Uniplus/models/Catalogo/catalogo_model.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/widgets/errorWidget/error.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SerieVideoList extends StatefulWidget {
  String languageCode;

  SerieVideoList(this.languageCode);

  @override
  _SerieVideoListState createState() => _SerieVideoListState();
}

class _SerieVideoListState extends State<SerieVideoList> {
  Widget _erroFindSerie() {
    return Container(
        height: 400,
        child: Error(contentNotFound.getStringLanguage(widget.languageCode),
            Image.asset("assets/images/Error/sad.png")));
  }

  @override
  Widget build(BuildContext context) {
    var serieVideos = CatalogoModel.getInstance().serieVideos;

    int itemCount = serieVideos == null
        ? 1
        : serieVideos.isEmpty
            ? 1
            : serieVideos.length;

    return Container(
      height: MediaQuery.of(context).size.height / 2,
      color: Colors.black,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          if (serieVideos == null) {
            return _erroFindSerie();
          } else if (serieVideos.isEmpty) {
            return _erroFindSerie();
          } else if (serieVideos.length > 0) {
            if (serieVideos[index] == null) {
              return _erroFindSerie();
            }
          }

          return Padding(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    serieVideos[index].nome.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: serieVideos[index].key,
                      flags: YoutubePlayerFlags(
                        hideControls: false,
                        controlsVisibleAtStart: false,
                        autoPlay: false,
                        mute: false,
                        forceHD: true,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.green,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
