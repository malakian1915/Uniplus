import 'package:Uniplus/controllers/language/language_controller.dart';
import 'package:Uniplus/controllers/movies/movie_controller.dart';
import 'package:Uniplus/core/api.dart';
import 'package:Uniplus/core/routes.dart';
import 'package:Uniplus/models/Catalogo/catalogoDTO.dart';
import 'package:Uniplus/models/Catalogo/catalogo_model.dart';
import 'package:Uniplus/models/movies/movie_model.dart';
import 'package:Uniplus/models/series/serie_model.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/views/search/grid_delegate.dart';
import 'package:Uniplus/widgets/errorWidget/error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchView extends StatefulWidget {
  String _languageCode;
  User _user;

  SearchView(this._user, this._languageCode);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _searchController = new TextEditingController();

  bool _isSearching = false;

  List<CatalogoDTO> contentSearch = new List<CatalogoDTO>();

  Future<List<CatalogoDTO>> _initializeSearch() async {
    await _loadLanguage();
    return await _loadContentSearch();
  }

  String languageCode;
  Future<String> _loadLanguage() async {
    var language = await LanguageController().getInstance().lerArquivo();
    languageCode = language.replaceAll("-", "_");
    return language ?? null;
  }

  Future<List<CatalogoDTO>> _loadContentSearch() async {
    contentSearch = new List<CatalogoDTO>();

    if (CatalogoModel.getInstance().movieSerieSearch.series != null) {
      List<SerieModel> seriesSearch = new List<SerieModel>();

      var series = CatalogoModel.getInstance().movieSerieSearch.series
          as List<SerieModel>;
      seriesSearch.addAll(series.where((x) => x != null));

      for (var serie in seriesSearch) {
        if (!contentSearch.contains(serie) && serie.posterPath != null) {
          contentSearch.add(new CatalogoDTO(
              serie.id, serie.name, serie.posterPath, serie.mediaType));
        }
      }
    }

    if (CatalogoModel.getInstance().movieSerieSearch.movies != null) {
      List<MovieModel> moviesSearch = new List<MovieModel>();

      var movies = CatalogoModel.getInstance().movieSerieSearch.movies
          as List<MovieModel>;
      moviesSearch.addAll(movies.where((x) => x != null));

      for (var movie in moviesSearch) {
        if (!contentSearch.contains(movie) && movie.posterPath != null) {
          contentSearch.add(new CatalogoDTO(
              movie.id, movie.title, movie.posterPath, movie.mediaType));
        }
      }
    }

    return contentSearch;
  }

  void searchContent(String query) async {
    setState(() {
      _isSearching = true;
    });

    await MovieController.getInstance().searchContent(query);

    setState(() {
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeSearch(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  backgroundColor: Colors.green,
                  centerTitle: true,
                  title: Container(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (!_isSearching) {
                            searchContent(value);
                          }
                        }
                      },
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.white,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        hintText: searchHere.getStringLanguage(languageCode),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                          onPressed: () => _searchController.clear(),
                        ),
                      ),
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                body: _isSearching
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.green,
                            ),
                          ),
                        ),
                      )
                    : contentSearch.length > 0
                        ? Container(
                            color: Colors.black,
                            child: GridView.builder(
                              padding: EdgeInsets.all(7),
                              itemCount: contentSearch.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                      crossAxisCount: 3,
                                      height: 150,
                                      crossAxisSpacing: 7,
                                      mainAxisSpacing: 7),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (contentSearch[index].mediaType ==
                                        "movie") {
                                      Navigator.of(context).push(Routes()
                                          .getInstance()
                                          .routeToMovieDetails(
                                              null,
                                              widget._user,
                                              widget._languageCode,
                                              movieId:
                                                  contentSearch[index].id));
                                    } else if (contentSearch[index].mediaType ==
                                        "tv") {
                                      Navigator.of(context).push(Routes()
                                          .getInstance()
                                          .routeToSerieDetails(
                                              null,
                                              widget._user,
                                              widget._languageCode,
                                              serieId:
                                                  contentSearch[index].id));
                                    }
                                  },
                                  child: Container(
                                    child: Tooltip(
                                      message: contentSearch[index].title,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                BASE_API_IMAGES +
                                                    "/w500" +
                                                    contentSearch[index]
                                                        .posterPath),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Error(contentNotFound.getStringLanguage(languageCode),
                            Image.asset("assets/images/Error/sad.png"))),
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
    _isSearching = false;
    super.dispose();
  }
}
