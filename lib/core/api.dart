import 'package:dio/dio.dart';

const BASE_API = "https://api.themoviedb.org/3";
const BASE_API_IMAGES = "https://image.tmdb.org/t/p";

const API_KEY =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwOWNjYWVmYjhjOWM1ZTZhZGY2NDIzMTk0MDkxYWIwOSIsInN1YiI6IjYwNGUyNTg5ZDEwMGI2MDA1NGM5ZWRiYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MloZ00RhxwQB4BV95ZTrTA-3UflN1eUzR_n1zjPL-L4";

final DIO_OPTIONS = BaseOptions(
    baseUrl: BASE_API,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json;charset=utf-8',
    headers: {'Authorization': 'Bearer $API_KEY'});

const MOVIES_POPULAR = '/movie/popular';
const SERIE_POPULAR = '/tv/popular';
const MOVIE_BY_ID = '/movie/';
const TRENDING_DAY_MOVIE = '/trending/movie/day';
const TRENDING_WEEK_MOVIE = '/trending/movie/week';
const TRENDING_DAY_SERIE = '/trending/tv/day';
const TRENDING_WEEK_SERIE = '/trending/tv/week';
const SEARCH = '/search/multi';
String GET_MOVIE_VIDEOS = '/movie/{movieId}/videos';
const SERIE_BY_ID = '/tv/';
String GET_SERIE_VIDEOS = '/tv/{tv_id}/season/{season_number}/videos';
