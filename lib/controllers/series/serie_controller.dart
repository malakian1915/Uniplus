import 'package:Uniplus/errors/content_error.dart';
import 'package:Uniplus/models/generos/generos_serie_model.dart';
import 'package:Uniplus/models/movieSerieList/videos_model.dart';
import 'package:Uniplus/models/series/serie_model.dart';
import 'package:Uniplus/models/series/serie_response_model.dart';
import 'package:Uniplus/repositories/series/serie_repository.dart';
import 'package:dartz/dartz.dart';

class SerieController {
  static SerieController _instance;

  static SerieController getInstance() {
    if (_instance == null) {
      _instance = new SerieController();
    }
    return _instance;
  }

  ContentError serieError;
  SerieModel responseSerieById;
  VideoModelResponse responseVideo;
  SerieResponseModel responseSerieTrendingDay;
  SerieResponseModel responseSerieTrendingWeek;
  SerieResponseModel responsePopularSeries;
  SerieResponseModel responseSeriesActionAdventure;
  SerieResponseModel responseSeriesAnimation;
  SerieResponseModel responseSeriesComedy;
  SerieResponseModel responseSeriesCrime;
  SerieResponseModel responseSeriesDocumentary;
  SerieResponseModel responseSeriesDrama;
  SerieResponseModel responseSeriesFamily;
  SerieResponseModel responseSeriesKids;
  SerieResponseModel responseSeriesMystery;
  SerieResponseModel responseSeriesNews;
  SerieResponseModel responseSeriesReality;
  SerieResponseModel responseSeriesSoap;
  SerieResponseModel responseSeriesTalk;
  SerieResponseModel responseSeriesWarPolitics;
  SerieResponseModel responseSeriesWestern;

  Future<Either<ContentError, SerieResponseModel>> getTrendingDaySerie() async {
    var result = await SerieRepository.getInstance().getTrendingDaySerie(
        responseSerieTrendingDay != null
            ? responseSerieTrendingDay.page + 1
            : 1);

    result.fold((error) => serieError = error, (serie) {
      if (responseSerieTrendingDay == null) {
        responseSerieTrendingDay = serie;
      } else {
        responseSerieTrendingDay.page = serie.page;
        responseSerieTrendingDay.series.addAll(serie.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>>
      getTrendingWeekSerie() async {
    var result = await SerieRepository.getInstance().getTrendingWeekSeries(
        responseSerieTrendingWeek != null
            ? responseSerieTrendingWeek.page + 1
            : 1);

    result.fold((error) => serieError = error, (serie) {
      if (responseSerieTrendingWeek == null) {
        responseSerieTrendingWeek = serie;
      } else {
        responseSerieTrendingWeek.page = serie.page;
        responseSerieTrendingWeek.series.addAll(serie.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getPopularSeries() async {
    var result = await SerieRepository.getInstance().getPopularSeries(
        responsePopularSeries != null ? responsePopularSeries.page + 1 : 1);

    result.fold((error) => serieError = error, (serie) {
      if (responsePopularSeries == null) {
        responsePopularSeries = serie;
      } else {
        responsePopularSeries.page = serie.page;
        responsePopularSeries.series.addAll(serie.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>>
      getActionAdventureSeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesActionAdventure != null
            ? responseSeriesActionAdventure.page + 1
            : 1,
        actionAdventure);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesActionAdventure == null) {
        responseSeriesActionAdventure = response;
      } else {
        responseSeriesActionAdventure.page = response.page;
        responseSeriesActionAdventure.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getAnimationSeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesAnimation != null ? responseSeriesAnimation.page + 1 : 1,
        animation);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesAnimation == null) {
        responseSeriesAnimation = response;
      } else {
        responseSeriesAnimation.page = response.page;
        responseSeriesAnimation.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getComedySeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesComedy != null ? responseSeriesComedy.page + 1 : 1,
        comedy);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesComedy == null) {
        responseSeriesComedy = response;
      } else {
        responseSeriesComedy.page = response.page;
        responseSeriesComedy.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getCrimeSeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesCrime != null ? responseSeriesCrime.page + 1 : 1, crime);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesCrime == null) {
        responseSeriesCrime = response;
      } else {
        responseSeriesCrime.page = response.page;
        responseSeriesCrime.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>>
      getDocumentarySeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesDocumentary != null
            ? responseSeriesDocumentary.page + 1
            : 1,
        documentary);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesDocumentary == null) {
        responseSeriesDocumentary = response;
      } else {
        responseSeriesDocumentary.page = response.page;
        responseSeriesDocumentary.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getDramaSeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesDrama != null ? responseSeriesDrama.page + 1 : 1, drama);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesDrama == null) {
        responseSeriesDrama = response;
      } else {
        responseSeriesDrama.page = response.page;
        responseSeriesDrama.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getFamilySeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesFamily != null ? responseSeriesFamily.page + 1 : 1,
        family);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesFamily == null) {
        responseSeriesFamily = response;
      } else {
        responseSeriesFamily.page = response.page;
        responseSeriesFamily.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getKidsSeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesKids != null ? responseSeriesKids.page + 1 : 1, kids);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesKids == null) {
        responseSeriesKids = response;
      } else {
        responseSeriesKids.page = response.page;
        responseSeriesKids.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getMisterySeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesMystery != null ? responseSeriesMystery.page + 1 : 1,
        mystery);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesMystery == null) {
        responseSeriesMystery = response;
      } else {
        responseSeriesMystery.page = response.page;
        responseSeriesMystery.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getNewsSeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesNews != null ? responseSeriesNews.page + 1 : 1, news);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesNews == null) {
        responseSeriesNews = response;
      } else {
        responseSeriesNews.page = response.page;
        responseSeriesNews.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getRealitySeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesReality != null ? responseSeriesReality.page + 1 : 1,
        reality);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesReality == null) {
        responseSeriesReality = response;
      } else {
        responseSeriesReality.page = response.page;
        responseSeriesReality.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getSoapSeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesSoap != null ? responseSeriesSoap.page + 1 : 1, soap);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesSoap == null) {
        responseSeriesSoap = response;
      } else {
        responseSeriesSoap.page = response.page;
        responseSeriesSoap.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getTalkSeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesTalk != null ? responseSeriesTalk.page + 1 : 1, talk);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesTalk == null) {
        responseSeriesTalk = response;
      } else {
        responseSeriesTalk.page = response.page;
        responseSeriesTalk.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>>
      getWarPoliticsSeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesWarPolitics != null
            ? responseSeriesWarPolitics.page + 1
            : 1,
        warPolitics);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesWarPolitics == null) {
        responseSeriesWarPolitics = response;
      } else {
        responseSeriesWarPolitics.page = response.page;
        responseSeriesWarPolitics.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieResponseModel>> getWesternSeries() async {
    var result = await SerieRepository.getInstance().getSeriesByCatagoria(
        responseSeriesWestern != null ? responseSeriesWestern.page + 1 : 1,
        western);

    result.fold((error) => serieError = error, (response) {
      if (responseSeriesWestern == null) {
        responseSeriesWestern = response;
      } else {
        responseSeriesWestern.page = response.page;
        responseSeriesWestern.series.addAll(response.series);
      }
    });

    return result;
  }

  Future<Either<ContentError, SerieModel>> getSerieById(int id) async {
    var result = await SerieRepository.getInstance().getSerieById(id);

    result.fold((error) => serieError = error, (serie) {
      responseSerieById = serie;
    });

    return result;
  }

  Future<Either<ContentError, VideoModelResponse>> getSerieVideos(
      int serieId, int seasonNumber) async {
    var result = await SerieRepository.getInstance()
        .getSerieVideos(serieId, seasonNumber);

    result.fold((error) => serieError = error, (response) {
      responseVideo = response;
    });

    return result;
  }

  void cleanSeries() {
    serieError = null;
    responseSerieById = null;
    responseVideo = null;
    responseSerieTrendingDay = null;
    responseSerieTrendingWeek = null;
    responsePopularSeries = null;
    responseSeriesActionAdventure = null;
    responseSeriesAnimation = null;
    responseSeriesComedy = null;
    responseSeriesCrime = null;
    responseSeriesDocumentary = null;
    responseSeriesDrama = null;
    responseSeriesFamily = null;
    responseSeriesKids = null;
    responseSeriesMystery = null;
    responseSeriesNews = null;
    responseSeriesReality = null;
    responseSeriesSoap = null;
    responseSeriesTalk = null;
    responseSeriesWarPolitics = null;
    responseSeriesWestern = null;
  }
}
