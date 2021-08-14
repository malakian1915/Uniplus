import 'package:Uniplus/core/api.dart';
import 'package:Uniplus/errors/content_error.dart';
import 'package:Uniplus/models/movieSerieList/movie_serie_model.dart';
import 'package:Uniplus/models/movies/movie_model.dart';
import 'package:Uniplus/models/movies/movie_response_model.dart';
import 'package:Uniplus/models/movieSerieList/videos_model.dart';
import 'package:Uniplus/repositories/repository_base/repository_base.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class MovieRepository extends RepositoryBase {
  final Dio _dio = Dio(DIO_OPTIONS);
  String _languageCode;

  static MovieRepository _instance;

  static MovieRepository getInstance() {
    if (_instance == null) {
      _instance = new MovieRepository();
    }
    return _instance;
  }

  Future<Either<ContentError, MovieResponseModel>> getPopularMovies(
      int page) async {
    var queryParameters = await getParameters(page: page);
    try {
      final response =
          await _dio.get(MOVIES_POPULAR, queryParameters: queryParameters);
      final movieResponse = MovieResponseModel.fromJson(response.data);
      return Right(movieResponse);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            ContentRepositoryError(error.response.data['status_message']));
      } else {
        return Left(ContentRepositoryError(
            serverError.getStringLanguage(_languageCode)));
      }
    } on Exception catch (error) {
      return Left(ContentRepositoryError(error.toString()));
    }
  }

  Future<Either<ContentError, MovieModel>> getMovieById(int id) async {
    var queryParameters = await getParameters();
    try {
      final response = await _dio.get(MOVIE_BY_ID + id.toString(),
          queryParameters: queryParameters);
      final movieResponse = MovieModel.fromJson(response.data);
      return Right(movieResponse);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            ContentRepositoryError(error.response.data['status_message']));
      } else {
        return Left(ContentRepositoryError(
            serverError.getStringLanguage(_languageCode)));
      }
    } on Exception catch (error) {
      return Left(ContentRepositoryError(error.toString()));
    }
  }

  Future<Either<ContentError, MovieResponseModel>> getTrendingDayMovie(
      int page) async {
    var queryParameters = await getParameters(page: page);
    try {
      final response =
          await _dio.get(TRENDING_DAY_MOVIE, queryParameters: queryParameters);
      final movieResponse = MovieResponseModel.fromJson(response.data);
      return Right(movieResponse);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            ContentRepositoryError(error.response.data['status_message']));
      } else {
        return Left(ContentRepositoryError(
            serverError.getStringLanguage(_languageCode)));
      }
    } on Exception catch (error) {
      return Left(ContentRepositoryError(error.toString()));
    }
  }

  Future<Either<ContentError, MovieResponseModel>> getTrendingWeekMovie(
      int page) async {
    var queryParameters = await getParameters(page: page);
    try {
      final response =
          await _dio.get(TRENDING_WEEK_MOVIE, queryParameters: queryParameters);
      final movieResponse = MovieResponseModel.fromJson(response.data);
      return Right(movieResponse);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            ContentRepositoryError(error.response.data['status_message']));
      } else {
        return Left(ContentRepositoryError(
            serverError.getStringLanguage(_languageCode)));
      }
    } on Exception catch (error) {
      return Left(ContentRepositoryError(error.toString()));
    }
  }

  Future<Either<ContentError, MovieResponseModel>> getMoviesCategoria(
      int page, int categoria) async {
    var queryParameters = await getParameters(page: page, genero: categoria);
    try {
      final response =
          await _dio.get(MOVIES_POPULAR, queryParameters: queryParameters);
      final moviesResponse = MovieResponseModel.fromJson(response.data);
      return Right(moviesResponse);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            ContentRepositoryError(error.response.data['status_message']));
      } else {
        return Left(ContentRepositoryError(
            serverError.getStringLanguage(_languageCode)));
      }
    } on Exception catch (error) {
      return Left(ContentRepositoryError(error.toString()));
    }
  }

  Future<Either<ContentError, MovieSerieModel>> searchContent(
      String search, int page) async {
    var queryParameters = await getParameters(query: search, page: page);
    try {
      final response = await _dio.get(SEARCH, queryParameters: queryParameters);
      final contentResponse = MovieSerieModel.fromJson(response.data);
      return Right(contentResponse);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            ContentRepositoryError(error.response.data['status_message']));
      } else {
        return Left(ContentRepositoryError(
            serverError.getStringLanguage(_languageCode)));
      }
    } on Exception catch (error) {
      return Left(ContentRepositoryError(error.toString()));
    }
  }

  Future<Either<ContentError, VideoModelResponse>> getMovieVideos(
      int movieId) async {
    var queryParameters = await getParameters();
    try {
      final response = await _dio.get(
          GET_MOVIE_VIDEOS.replaceAll('{movieId}', movieId.toString()),
          queryParameters: queryParameters);
      final contentResponse = VideoModelResponse.fromJsonList(response.data);
      return Right(contentResponse);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            ContentRepositoryError(error.response.data['status_message']));
      } else {
        return Left(ContentRepositoryError(
            serverError.getStringLanguage(_languageCode)));
      }
    } on Exception catch (error) {
      return Left(ContentRepositoryError(error.toString()));
    }
  }
}
