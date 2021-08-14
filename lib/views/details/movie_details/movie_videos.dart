import 'package:Uniplus/models/Catalogo/catalogo_model.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/widgets/errorWidget/error.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoList extends StatefulWidget {
  String languageCode;

  VideoList(this.languageCode);

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  Widget _erroFindMovie() {
    return Container(
        height: 400,
        child: Error(contentNotFound.getStringLanguage(widget.languageCode),
            Image.asset("assets/images/Error/sad.png")));
  }

  @override
  Widget build(BuildContext context) {
    var movieVideos = CatalogoModel.getInstance().movieVideos;

    int itemCount = movieVideos == null
        ? 1
        : movieVideos.isEmpty
            ? 1
            : movieVideos.length;

    return Container(
      height: MediaQuery.of(context).size.height / 2,
      color: Colors.black,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          if (movieVideos == null) {
            return _erroFindMovie();
          } else if (movieVideos.isEmpty) {
            return _erroFindMovie();
          } else if (movieVideos.length > 0) {
            if (movieVideos[index] == null) {
              return _erroFindMovie();
            }
          }

          return Padding(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    movieVideos[index].nome.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: movieVideos[index].key,
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
