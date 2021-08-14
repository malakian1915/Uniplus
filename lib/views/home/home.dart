import 'package:Uniplus/models/Catalogo/catalogo_model.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/views/home/home_background.dart';
import 'package:Uniplus/widgets/listCards/list_cards.dart';
import 'package:Uniplus/widgets/listCards/title_cards.dart';
import 'package:Uniplus/widgets/shared/appBar/app_bar.dart';
import 'package:Uniplus/widgets/shared/floatingButtonUserImage/floating_button_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key, User user, String languageCode})
      : _user = user,
        _languageCode = languageCode,
        super(key: key);

  final User _user;
  final String _languageCode;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool homeLink = true;
  bool movieLink = false;
  bool serieLink = false;

  List<Widget> _generateCards() {
    List<Widget> listCards = new List<Widget>();

    if (homeLink) {
      listCards.add(TitleCards(
          catalogoMoviesTrendingDay.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesTrendingDay),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesTrendingWeek.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesTrendingWeek),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesPopular.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesPopular),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoSeriesTrendingDay.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieTrendingDay),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoSeriesTrendingWeek.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieTrendingWeek),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoSeriesPopular.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().seriePopular),
          widget._user,
          widget._languageCode));
    } else if (movieLink) {
      listCards.add(TitleCards(
          catalogoMoviesAction.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesAction),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesAdventure.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesAdventure),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesAnimation.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesAnimation),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesComedy.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesComedy),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesCrime.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesCrime),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesDocumentary.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesDocumentary),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesDrama.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesDrama),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesFamily.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesFamily),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesFantasy.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesFantasy),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesHistory.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesHistory),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesHorror.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesHorror),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesMusic.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesMusic),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesMystery.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesMystery),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesRomance.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesRomance),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(catalogoMoviesScienceFiction
          .getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesScienceFiction),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesTvMovie.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesTvMovie),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesThiller.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesThriller),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesWar.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(dartz.Left(CatalogoModel.getInstance().moviesWar),
          widget._user, widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesWestern.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Left(CatalogoModel.getInstance().moviesWestern),
          widget._user,
          widget._languageCode));
    } else if (serieLink) {
      listCards.add(TitleCards(catalogoSerieActionAdventure
          .getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieActionAdventure),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesAnimation.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieAnimation),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesComedy.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieComedy),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesCrime.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieCrime),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesDocumentary.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieDocumentary),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesDrama.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieDrama),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesFamily.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieFamily),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoSerieKids.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieKids),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesMystery.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieMystery),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoSerieNews.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieNews),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoSerieReality.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieReality),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoSerieTalk.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieTalk),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesWar.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieWarPolitics),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoMoviesWestern.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieWestern),
          widget._user,
          widget._languageCode));
      listCards.add(TitleCards(
          catalogoSerieSoap.getStringLanguage(widget._languageCode)));
      listCards.add(ListCards(
          dartz.Right(CatalogoModel.getInstance().serieSoap),
          widget._user,
          widget._languageCode));
    }

    return listCards;
  }

  Widget _createBottomBar(String languageCode) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.green,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  homeLink = true;
                  movieLink = false;
                  serieLink = false;
                });
              },
              icon: Icon(
                Icons.home,
                color: homeLink ? Colors.red : Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  homeLink = false;
                  movieLink = false;
                  serieLink = true;
                });
              },
              child: Text(
                serieLabel.getStringLanguage(languageCode),
                style: TextStyle(
                  color: serieLink ? Colors.red : Colors.white,
                  fontSize: 17,
                  letterSpacing: 1,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  homeLink = false;
                  movieLink = true;
                  serieLink = false;
                });
              },
              child: Text(
                movieLabel.getStringLanguage(languageCode),
                style: TextStyle(
                  color: movieLink ? Colors.red : Colors.white,
                  fontSize: 17,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            HomeBackground(),
            Scaffold(
              extendBody: true,
              appBar: AppBarUniplus(
                widget._user,
                widget._languageCode,
              ),
              bottomNavigationBar: _createBottomBar(widget._languageCode),
              backgroundColor: Colors.transparent,
              floatingActionButton: FloatingButtonUser(user: widget._user),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endDocked,
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height - 128, 0, 48),
                  child: Column(
                    children: _generateCards(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
