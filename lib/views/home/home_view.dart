import 'package:Uniplus/controllers/language/language_controller.dart';
import 'package:Uniplus/controllers/movies/movie_controller.dart';
import 'package:Uniplus/controllers/series/serie_controller.dart';
import 'package:Uniplus/errors/content_error.dart';
import 'package:Uniplus/models/movies/movie_response_model.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/views/home/home.dart';
import 'package:Uniplus/widgets/errorWidget/error.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key, User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<String> _initializeHome() async {
    await carregarCatalogoHome();
    return await _loadLanguage();
  }

  Future<dartz.Either<ContentError, MovieResponseModel>>
      carregarCatalogoHome() async {
    // HOME
    await MovieController.getInstance().getPopularMovies();
    await MovieController.getInstance().getTrendingDayMovie();
    await MovieController.getInstance().getTrendingWeekMovie();
    await SerieController.getInstance().getTrendingDaySerie();
    await SerieController.getInstance().getTrendingWeekSerie();
    await SerieController.getInstance().getPopularSeries();
    // SERIES
    await SerieController.getInstance().getActionAdventureSeries();
    await SerieController.getInstance().getAnimationSeries();
    await SerieController.getInstance().getComedySeries();
    await SerieController.getInstance().getCrimeSeries();
    await SerieController.getInstance().getDocumentarySeries();
    await SerieController.getInstance().getDramaSeries();
    await SerieController.getInstance().getFamilySeries();
    await SerieController.getInstance().getKidsSeries();
    await SerieController.getInstance().getMisterySeries();
    await SerieController.getInstance().getNewsSeries();
    await SerieController.getInstance().getRealitySeries();
    await SerieController.getInstance().getTalkSeries();
    await SerieController.getInstance().getWarPoliticsSeries();
    await SerieController.getInstance().getWesternSeries();
    await SerieController.getInstance().getSoapSeries();
    //FILMES
    await MovieController.getInstance().getMoviesCategoriaAction();
    await MovieController.getInstance().getMoviesCategoriaAdventure();
    await MovieController.getInstance().getMoviesCategoriaAnimation();
    await MovieController.getInstance().getMoviesCategoriaComedy();
    await MovieController.getInstance().getMoviesCategoriaCrime();
    await MovieController.getInstance().getMoviesCategoriaDocumentary();
    await MovieController.getInstance().getMoviesCategoriaDrama();
    await MovieController.getInstance().getMoviesCategoriaFamily();
    await MovieController.getInstance().getMoviesCategoriaFantasy();
    await MovieController.getInstance().getMoviesCategoriaHistory();
    await MovieController.getInstance().getMoviesCategoriaHorror();
    await MovieController.getInstance().getMoviesCategoriaMusic();
    await MovieController.getInstance().getMoviesCategoriaMystery();
    await MovieController.getInstance().getMoviesCategoriaRomance();
    await MovieController.getInstance().getMoviesCategoriaScienceFiction();
    await MovieController.getInstance().getMoviesCategoriaTvMovie();
    await MovieController.getInstance().getMoviesCategoriaThriller();
    await MovieController.getInstance().getMoviesCategoriaWar();
    return await MovieController.getInstance().getMoviesCategoriaWestern();
  }

  String languageCode;
  Future<String> _loadLanguage() async {
    var language = await LanguageController().getInstance().lerArquivo();
    languageCode = language.replaceAll("-", "_");
    return language ?? null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeHome(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Error(flutterError.getStringLanguage(languageCode),
              Image.asset("assets/images/Error/error.png"));
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Home(
            user: widget._user,
            languageCode: languageCode,
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
}
