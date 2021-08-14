import 'package:Uniplus/controllers/movies/movie_controller.dart';
import 'package:Uniplus/controllers/payment/payment_controller.dart';
import 'package:Uniplus/core/api.dart';
import 'package:Uniplus/models/Catalogo/catalogo_model.dart';
import 'package:Uniplus/models/movies/movie_model.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/views/details/circular_clipper/circular_clipper.dart';
import 'package:Uniplus/views/details/movie_details/movie_videos.dart';
import 'package:Uniplus/widgets/contentDetails/likes.dart';
import 'package:Uniplus/widgets/contentDetails/popularity.dart';
import 'package:Uniplus/widgets/shared/appBar/app_bar.dart';
import 'package:Uniplus/widgets/shared/details/sign_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  MovieModel _movie;
  User _user;
  String _languageCode;
  int _movieId;

  MovieDetails(this._movie, this._user, this._languageCode, {movieId})
      : _movieId = movieId;

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  Future<void> _getMovieVideos() async {
    if (widget._movie == null && widget._movieId != null) {
      await MovieController.getInstance().getMovieById(widget._movieId);
      widget._movie = CatalogoModel.getInstance().movieById;
      await MovieController.getInstance().getMovieVideos(widget._movieId);
    } else {
      await MovieController.getInstance().getMovieVideos(widget._movie.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getMovieVideos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SafeArea(
            child: Scaffold(
              extendBodyBehindAppBar: false,
              appBar: AppBarUniplus(
                widget._user,
                widget._languageCode,
                cor: Colors.black45,
                showLeadingArrow: true,
              ),
              body: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(0, 0, 0),
                      child: Hero(
                        tag: widget._movie.posterPath,
                        child: ClipShadowPath(
                          clipper: CircularClipper(),
                          shadow: Shadow(blurRadius: 20.0),
                          child: Image(
                            height: 500.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            image: NetworkImage(BASE_API_IMAGES +
                                "/w500" +
                                widget._movie.posterPath),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        PopularidadeWidget(
                            widget._movie.voteAverage, widget._languageCode),
                        Spacer(),
                        LikesWidget(
                            widget._movie.voteCount, widget._languageCode),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Text(
                        widget._movie.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        widget._movie.overview.toString().isNotEmpty
                            ? widget._movie.overview.toString()
                            : withoutOverview
                                .getStringLanguage(widget._languageCode),
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    PaymentController.getInstance().paymentJsonModel.planDTO ==
                            null
                        ? Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child:
                                SignButton(widget._user, widget._languageCode),
                          )
                        : Container(),
                    PaymentController.getInstance().paymentJsonModel.planDTO !=
                            null
                        ? Container(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              videoLabel
                                  .getStringLanguage(widget._languageCode),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Container(),
                    PaymentController.getInstance().paymentJsonModel.planDTO !=
                            null
                        ? VideoList(widget._languageCode)
                        : Container(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    MovieController.getInstance().responseMovieVideo = null;
    super.dispose();
  }
}
