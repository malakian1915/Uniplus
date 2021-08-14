import 'package:Uniplus/core/api.dart';
import 'package:Uniplus/errors/content_error.dart';
import 'package:Uniplus/models/movieSerieList/videos_model.dart';
import 'package:Uniplus/models/series/serie_model.dart';
import 'package:Uniplus/models/series/serie_response_model.dart';
import 'package:Uniplus/repositories/repository_base/repository_base.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class SerieRepository extends RepositoryBase {
  final Dio _dio = Dio(DIO_OPTIONS);
  String _languageCode;

  static SerieRepository _instance;

  static SerieRepository getInstance() {
    if (_instance == null) {
      _instance = new SerieRepository();
    }
    return _instance;
  }

  Future<Either<ContentError, SerieResponseModel>> getPopularSeries(
      int page) async {
    var queryParameters = await getParameters(page: page);
    try {
      final response =
          await _dio.get(SERIE_POPULAR, queryParameters: queryParameters);
      final serieResponse = SerieResponseModel.fromJson(response.data);
      return Right(serieResponse);
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

  Future<Either<ContentError, SerieModel>> getSerieById(int id) async {
    var queryParameters = await getParameters();
    try {
      final response = await _dio.get(SERIE_BY_ID + id.toString(),
          queryParameters: queryParameters);
      final serieResponse = SerieModel.fromJsonList(response.data);
      return Right(serieResponse);
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

  Future<Either<ContentError, SerieResponseModel>> getTrendingDaySerie(
      int page) async {
    var queryParameters = await getParameters(page: page);
    try {
      final response =
          await _dio.get(TRENDING_DAY_SERIE, queryParameters: queryParameters);
      final serieResponse = SerieResponseModel.fromJson(response.data);
      return Right(serieResponse);
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

  Future<Either<ContentError, SerieResponseModel>> getTrendingWeekSeries(
      int page) async {
    var queryParameters = await getParameters(page: page);
    try {
      final response =
          await _dio.get(TRENDING_WEEK_SERIE, queryParameters: queryParameters);
      final serieResponse = SerieResponseModel.fromJson(response.data);
      return Right(serieResponse);
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

  Future<Either<ContentError, SerieResponseModel>> getSeriesByCatagoria(
      int page, int catagoria) async {
    var queryParameters = await getParameters(page: page, genero: catagoria);
    try {
      final response =
          await _dio.get(SERIE_POPULAR, queryParameters: queryParameters);
      final seriesResponse = SerieResponseModel.fromJson(response.data);
      return Right(seriesResponse);
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

  Future<Either<ContentError, VideoModelResponse>> getSerieVideos(
      int serieId, int seasonNumber) async {
    var queryParameters = await getParameters();
    try {
      final response = await _dio.get(
          GET_SERIE_VIDEOS
              .replaceAll('{tv_id}', serieId.toString())
              .replaceAll('{season_number}', seasonNumber.toString()),
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
