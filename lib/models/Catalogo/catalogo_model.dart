import 'package:Uniplus/controllers/movies/movie_controller.dart';
import 'package:Uniplus/controllers/series/serie_controller.dart';
import 'package:Uniplus/models/movieSerieList/movie_serie_model.dart';
import 'package:Uniplus/models/movies/movie_model.dart';
import 'package:Uniplus/models/movieSerieList/videos_model.dart';
import 'package:Uniplus/models/series/serie_model.dart';

class CatalogoModel {
  static CatalogoModel _instance;

  static CatalogoModel getInstance() {
    if (_instance == null) {
      _instance = new CatalogoModel();
    }
    return _instance;
  }

  //FILMES
  List<MovieModel> get moviesTrendingDay =>
      MovieController.getInstance().responseMoviesTrendingDay?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesTrendingWeek =>
      MovieController.getInstance().responseMoviesTrendingWeek?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesPopular =>
      MovieController.getInstance().resopnseMoviesPopular?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesAction =>
      MovieController.getInstance().responseMoviesAction?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesAdventure =>
      MovieController.getInstance().responseMoviesAdventure?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesAnimation =>
      MovieController.getInstance().resopnseMoviesAnimation?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesComedy =>
      MovieController.getInstance().responseMoviesComedy?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesCrime =>
      MovieController.getInstance().responseMoviesCrime?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesDocumentary =>
      MovieController.getInstance().responseMoviesDocumentary?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesDrama =>
      MovieController.getInstance().responseMoviesDrama?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesFamily =>
      MovieController.getInstance().responseMoviesFamily?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesFantasy =>
      MovieController.getInstance().responseMoviesFantasy?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesHistory =>
      MovieController.getInstance().responseMoviesHistory?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesHorror =>
      MovieController.getInstance().responseMoviesHorror?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesMusic =>
      MovieController.getInstance().responseMoviesMusic?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesMystery =>
      MovieController.getInstance().responseMoviesMystery?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesRomance =>
      MovieController.getInstance().responseMoviesRomance?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesScienceFiction =>
      MovieController.getInstance().responseMoviesScienceFiction?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesTvMovie =>
      MovieController.getInstance().responseMoviesTvMovie?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesThriller =>
      MovieController.getInstance().responseMoviesThriller?.movies ??
      <MovieModel>[];
  List<MovieModel> get moviesWar =>
      MovieController.getInstance().responseMoviesWar?.movies ?? <MovieModel>[];
  List<MovieModel> get moviesWestern =>
      MovieController.getInstance().responseMoviesWestern?.movies ??
      <MovieModel>[];
  List<VideosModel> get movieVideos =>
      MovieController.getInstance().responseMovieVideo?.getVideos ??
      <VideosModel>[];
  MovieSerieModel get movieSerieSearch =>
      MovieController.getInstance().responseMovieSerieSearch ??
      MovieSerieModel();
  MovieModel get movieById =>
      MovieController.getInstance().responseMovieById ?? MovieModel();

  //SERIES
  SerieModel get serieById =>
      SerieController.getInstance().responseSerieById ?? SerieModel();
  List<VideosModel> get serieVideos =>
      SerieController.getInstance().responseVideo?.getVideos ?? <VideosModel>[];
  List<SerieModel> get serieTrendingDay =>
      SerieController.getInstance().responseSerieTrendingDay?.series ??
      <SerieModel>[];
  List<SerieModel> get serieTrendingWeek =>
      SerieController.getInstance().responseSerieTrendingWeek?.series ??
      <SerieModel>[];
  List<SerieModel> get seriePopular =>
      SerieController.getInstance().responsePopularSeries?.series ??
      <SerieModel>[];
  List<SerieModel> get serieActionAdventure =>
      SerieController.getInstance().responseSeriesActionAdventure?.series ??
      <SerieModel>[];
  List<SerieModel> get serieAnimation =>
      SerieController.getInstance().responseSeriesAnimation?.series ??
      <SerieModel>[];
  List<SerieModel> get serieComedy =>
      SerieController.getInstance().responseSeriesComedy?.series ??
      <SerieModel>[];
  List<SerieModel> get serieCrime =>
      SerieController.getInstance().responseSeriesCrime?.series ??
      <SerieModel>[];
  List<SerieModel> get serieDocumentary =>
      SerieController.getInstance().responseSeriesDocumentary?.series ??
      <SerieModel>[];
  List<SerieModel> get serieDrama =>
      SerieController.getInstance().responseSeriesDrama?.series ??
      <SerieModel>[];
  List<SerieModel> get serieFamily =>
      SerieController.getInstance().responseSeriesFamily?.series ??
      <SerieModel>[];
  List<SerieModel> get serieKids =>
      SerieController.getInstance().responseSeriesKids?.series ??
      <SerieModel>[];
  List<SerieModel> get serieMystery =>
      SerieController.getInstance().responseSeriesMystery?.series ??
      <SerieModel>[];
  List<SerieModel> get serieNews =>
      SerieController.getInstance().responseSeriesNews?.series ??
      <SerieModel>[];
  List<SerieModel> get serieReality =>
      SerieController.getInstance().responseSeriesReality?.series ??
      <SerieModel>[];
  List<SerieModel> get serieSoap =>
      SerieController.getInstance().responseSeriesSoap?.series ??
      <SerieModel>[];
  List<SerieModel> get serieTalk =>
      SerieController.getInstance().responseSeriesTalk?.series ??
      <SerieModel>[];
  List<SerieModel> get serieWarPolitics =>
      SerieController.getInstance().responseSeriesWarPolitics?.series ??
      <SerieModel>[];
  List<SerieModel> get serieWestern =>
      SerieController.getInstance().responseSeriesWestern?.series ??
      <SerieModel>[];
}
