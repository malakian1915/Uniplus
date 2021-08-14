import 'package:Uniplus/core/api.dart';
import 'package:Uniplus/core/routes.dart';
import 'package:Uniplus/models/movies/movie_model.dart';
import 'package:Uniplus/models/series/serie_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListCards extends StatelessWidget {
  List<MovieModel> _movieContent;
  List<SerieModel> _serieContent;
  User _user;
  String _languageCode;

  ListCards(Either<List<MovieModel>, List<SerieModel>> listContent, this._user,
      this._languageCode) {
    listContent.fold((listMovie) {
      listMovie.removeWhere((x) => x == null);
      _movieContent = listMovie;
      _serieContent = null;
    }, (listSerie) {
      listSerie.removeWhere((x) => x == null);
      _serieContent = listSerie;
      _movieContent = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.black,
      padding: EdgeInsets.only(left: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _movieContent != null
            ? _movieContent.length
            : _serieContent != null
                ? _serieContent.length
                : 0,
        itemBuilder: (BuildContext context, int index) {
          String posterPath = _movieContent != null
              ? _movieContent[index].posterPath
              : _serieContent != null
                  ? _serieContent[index].posterPath
                  : "";

          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                if (_movieContent != null) {
                  Navigator.of(context).push(Routes()
                      .getInstance()
                      .routeToMovieDetails(
                          _movieContent[index], _user, _languageCode));
                } else if (_serieContent != null) {
                  Navigator.of(context).push(Routes()
                      .getInstance()
                      .routeToSerieDetails(null, _user, _languageCode,
                          serieId: _serieContent[index].id));
                }
              },
              child: Tooltip(
                message: _movieContent != null
                    ? _movieContent[index].title
                    : _serieContent != null
                        ? _serieContent[index].name
                        : "",
                child: Container(
                  width: 110,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage(BASE_API_IMAGES + "/w500" + posterPath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
