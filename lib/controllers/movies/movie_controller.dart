import 'package:Uniplus/errors/content_error.dart';
import 'package:Uniplus/models/generos/generos_movie_model.dart';
import 'package:Uniplus/models/movieSerieList/movie_serie_model.dart';
import 'package:Uniplus/models/movies/movie_model.dart';
import 'package:Uniplus/models/movies/movie_response_model.dart';
import 'package:Uniplus/models/movieSerieList/videos_model.dart';
import 'package:Uniplus/models/series/serie_model.dart';
import 'package:Uniplus/repositories/movies/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieController {
  static MovieController _instance;

  static MovieController getInstance() {
    if (_instance == null) {
      _instance = new MovieController();
    }
    return _instance;
  }

  MovieController() {
    responseMovieSerieSearch = new MovieSerieModel(
        page: 0,
        totalResults: 0,
        totalPages: 0,
        movies: new List<MovieModel>(),
        series: new List<SerieModel>());
  }

  ContentError movieError;
  MovieResponseModel responseMoviesTrendingDay;
  MovieResponseModel responseMoviesTrendingWeek;
  MovieResponseModel resopnseMoviesPopular;
  MovieResponseModel responseMoviesAction;
  MovieResponseModel responseMoviesAdventure;
  MovieResponseModel resopnseMoviesAnimation;
  MovieResponseModel responseMoviesComedy;
  MovieResponseModel responseMoviesCrime;
  MovieResponseModel responseMoviesDocumentary;
  MovieResponseModel responseMoviesDrama;
  MovieResponseModel responseMoviesFamily;
  MovieResponseModel responseMoviesFantasy;
  MovieResponseModel responseMoviesHistory;
  MovieResponseModel responseMoviesHorror;
  MovieResponseModel responseMoviesMusic;
  MovieResponseModel responseMoviesMystery;
  MovieResponseModel responseMoviesRomance;
  MovieResponseModel responseMoviesScienceFiction;
  MovieResponseModel responseMoviesTvMovie;
  MovieResponseModel responseMoviesThriller;
  MovieResponseModel responseMoviesWar;
  MovieResponseModel responseMoviesWestern;
  MovieSerieModel responseMovieSerieSearch;
  MovieModel responseMovieById;
  VideoModelResponse responseMovieVideo;

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaAction() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesAction != null ? responseMoviesAction.page + 1 : 1,
        action);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesAction == null) {
        responseMoviesAction = movie;
      } else {
        responseMoviesAction.page = movie.page;
        responseMoviesAction.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaAdventure() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesAdventure != null ? responseMoviesAdventure.page + 1 : 1,
        adventure);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesAdventure == null) {
        responseMoviesAdventure = movie;
      } else {
        responseMoviesAdventure.page = movie.page;
        responseMoviesAdventure.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaAnimation() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        resopnseMoviesAnimation != null ? resopnseMoviesAnimation.page + 1 : 1,
        animation);

    result.fold((error) => movieError = error, (movie) {
      if (resopnseMoviesAnimation == null) {
        resopnseMoviesAnimation = movie;
      } else {
        resopnseMoviesAnimation.page = movie.page;
        resopnseMoviesAnimation.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaComedy() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesComedy != null ? responseMoviesComedy.page + 1 : 1,
        comedy);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesComedy == null) {
        responseMoviesComedy = movie;
      } else {
        responseMoviesComedy.page = movie.page;
        responseMoviesComedy.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaCrime() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesCrime != null ? responseMoviesCrime.page + 1 : 1, crime);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesCrime == null) {
        responseMoviesCrime = movie;
      } else {
        responseMoviesCrime.page = movie.page;
        responseMoviesCrime.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaDocumentary() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesDocumentary != null
            ? responseMoviesDocumentary.page + 1
            : 1,
        documentary);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesDocumentary == null) {
        responseMoviesDocumentary = movie;
      } else {
        responseMoviesDocumentary.page = movie.page;
        responseMoviesDocumentary.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaDrama() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesDrama != null ? responseMoviesDrama.page + 1 : 1, drama);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesDrama == null) {
        responseMoviesDrama = movie;
      } else {
        responseMoviesDrama.page = movie.page;
        responseMoviesDrama.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaFamily() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesFamily != null ? responseMoviesFamily.page + 1 : 1,
        family);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesFamily == null) {
        responseMoviesFamily = movie;
      } else {
        responseMoviesFamily.page = movie.page;
        responseMoviesFamily.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaFantasy() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesFantasy != null ? responseMoviesFantasy.page + 1 : 1,
        fantasy);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesFantasy == null) {
        responseMoviesFantasy = movie;
      } else {
        responseMoviesFantasy.page = movie.page;
        responseMoviesFantasy.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaHistory() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesHistory != null ? responseMoviesHistory.page + 1 : 1,
        history);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesHistory == null) {
        responseMoviesHistory = movie;
      } else {
        responseMoviesHistory.page = movie.page;
        responseMoviesHistory.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaHorror() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesHorror != null ? responseMoviesHorror.page + 1 : 1,
        horror);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesHorror == null) {
        responseMoviesHorror = movie;
      } else {
        responseMoviesHorror.page = movie.page;
        responseMoviesHorror.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaMusic() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesMusic != null ? responseMoviesMusic.page + 1 : 1, music);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesMusic == null) {
        responseMoviesMusic = movie;
      } else {
        responseMoviesMusic.page = movie.page;
        responseMoviesMusic.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaMystery() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesMystery != null ? responseMoviesMystery.page + 1 : 1,
        mystery);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesMystery == null) {
        responseMoviesMystery = movie;
      } else {
        responseMoviesMystery.page = movie.page;
        responseMoviesMystery.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaRomance() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesRomance != null ? responseMoviesRomance.page + 1 : 1,
        romance);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesRomance == null) {
        responseMoviesRomance = movie;
      } else {
        responseMoviesRomance.page = movie.page;
        responseMoviesRomance.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaScienceFiction() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesScienceFiction != null
            ? responseMoviesScienceFiction.page + 1
            : 1,
        scienceFiction);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesScienceFiction == null) {
        responseMoviesScienceFiction = movie;
      } else {
        responseMoviesScienceFiction.page = movie.page;
        responseMoviesScienceFiction.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaTvMovie() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesTvMovie != null ? responseMoviesTvMovie.page + 1 : 1,
        tvMovie);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesTvMovie == null) {
        responseMoviesTvMovie = movie;
      } else {
        responseMoviesTvMovie.page = movie.page;
        responseMoviesTvMovie.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaThriller() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesThriller != null ? responseMoviesThriller.page + 1 : 1,
        thriller);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesThriller == null) {
        responseMoviesThriller = movie;
      } else {
        responseMoviesThriller.page = movie.page;
        responseMoviesThriller.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaWar() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesWar != null ? responseMoviesWar.page + 1 : 1, war);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesWar == null) {
        responseMoviesWar = movie;
      } else {
        responseMoviesWar.page = movie.page;
        responseMoviesWar.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getMoviesCategoriaWestern() async {
    var result = await MovieRepository.getInstance().getMoviesCategoria(
        responseMoviesWestern != null ? responseMoviesWestern.page + 1 : 1,
        western);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesWestern == null) {
        responseMoviesWestern = movie;
      } else {
        responseMoviesWestern.page = movie.page;
        responseMoviesWestern.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>> getPopularMovies() async {
    var result = await MovieRepository.getInstance().getPopularMovies(
        resopnseMoviesPopular != null ? resopnseMoviesPopular.page + 1 : 1);

    result.fold((error) => movieError = error, (movie) {
      if (resopnseMoviesPopular == null) {
        resopnseMoviesPopular = movie;
      } else {
        resopnseMoviesPopular.page = movie.page;
        resopnseMoviesPopular.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>> getTrendingDayMovie() async {
    var result = await MovieRepository.getInstance().getTrendingDayMovie(
        responseMoviesTrendingDay != null
            ? responseMoviesTrendingDay.page + 1
            : 1);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesTrendingDay == null) {
        responseMoviesTrendingDay = movie;
      } else {
        responseMoviesTrendingDay.page = movie.page;
        responseMoviesTrendingDay.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieResponseModel>>
      getTrendingWeekMovie() async {
    var result = await MovieRepository.getInstance().getTrendingWeekMovie(
        responseMoviesTrendingWeek != null
            ? responseMoviesTrendingWeek.page + 1
            : 1);

    result.fold((error) => movieError = error, (movie) {
      if (responseMoviesTrendingWeek == null) {
        responseMoviesTrendingWeek = movie;
      } else {
        responseMoviesTrendingWeek.page = movie.page;
        responseMoviesTrendingWeek.movies.addAll(movie.movies);
      }
    });

    return result;
  }

  Future<Either<ContentError, MovieModel>> getMovieById(int id) async {
    var result = await MovieRepository.getInstance().getMovieById(id);

    result.fold((error) => movieError = error, (movie) {
      responseMovieById = movie;
    });

    return result;
  }

  Future<Either<ContentError, MovieSerieModel>> searchContent(
      String query) async {
    var result = await MovieRepository.getInstance().searchContent(query, 1);

    result.fold((error) => movieError = error, (response) {
      responseMovieSerieSearch = response;
    });

    for (var i = 2; i <= 10; i++) {
      result = await MovieRepository.getInstance().searchContent(query, i);
      result.fold((error) => movieError = error, (response) {
        responseMovieSerieSearch.page = i;
        responseMovieSerieSearch.totalPages = response.totalPages;
        responseMovieSerieSearch.totalResults = response.totalResults;
        responseMovieSerieSearch.movies.addAll(response.movies);
        responseMovieSerieSearch.series.addAll(response.series);
      });
    }

    return result;
  }

  Future<Either<ContentError, VideoModelResponse>> getMovieVideos(
      int movieId) async {
    var result = await MovieRepository.getInstance().getMovieVideos(movieId);

    result.fold((error) => movieError = error, (response) {
      responseMovieVideo = response;
    });

    return result;
  }

  void cleanMovies() {
    movieError = null;
    responseMoviesTrendingDay = null;
    responseMoviesTrendingWeek = null;
    resopnseMoviesPopular = null;
    responseMovieSerieSearch = null;
    responseMovieById = null;
    responseMovieVideo = null;
    responseMoviesAction = null;
    responseMoviesAdventure = null;
    resopnseMoviesAnimation = null;
    responseMoviesComedy = null;
    responseMoviesCrime = null;
    responseMoviesDocumentary = null;
    responseMoviesDrama = null;
    responseMoviesFamily = null;
    responseMoviesFantasy = null;
    responseMoviesHistory = null;
    responseMoviesHorror = null;
    responseMoviesMusic = null;
    responseMoviesMystery = null;
    responseMoviesRomance = null;
    responseMoviesScienceFiction = null;
    responseMoviesTvMovie = null;
    responseMoviesThriller = null;
    responseMoviesWar = null;
    responseMoviesWestern = null;
  }
}
