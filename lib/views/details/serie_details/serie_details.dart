import 'package:Uniplus/controllers/payment/payment_controller.dart';
import 'package:Uniplus/controllers/series/serie_controller.dart';
import 'package:Uniplus/core/api.dart';
import 'package:Uniplus/models/Catalogo/catalogo_model.dart';
import 'package:Uniplus/models/series/season_model.dart';
import 'package:Uniplus/models/series/serie_model.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/views/details/circular_clipper/circular_clipper.dart';
import 'package:Uniplus/views/details/serie_details/serie_videos.dart';
import 'package:Uniplus/widgets/contentDetails/likes.dart';
import 'package:Uniplus/widgets/contentDetails/popularity.dart';
import 'package:Uniplus/widgets/shared/appBar/app_bar.dart';
import 'package:Uniplus/widgets/shared/details/sign_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SerieDetails extends StatefulWidget {
  SerieModel _serie;
  User _user;
  String _languageCode;
  int _serieId;

  SerieDetails(this._serie, this._user, this._languageCode, {serieId})
      : _serieId = serieId;

  @override
  _SerieDetailsState createState() => _SerieDetailsState();
}

class _SerieDetailsState extends State<SerieDetails> {
  String _selectedItem;
  String _episodiosCount;
  String _posterPath;
  String _overview;

  Future<void> _getSerieVideos() async {
    if (widget._serie == null && widget._serieId != null) {
      await SerieController.getInstance().getSerieById(widget._serieId);
      widget._serie = CatalogoModel.getInstance().serieById;
    }

    if (_selectedItem == null) {
      _selectedItem = widget._serie.seasons[0].id.toString();
      _episodiosCount = widget._serie.seasons[0].episodeCount.toString();
      _posterPath = widget._serie.posterPath;
      _overview = widget._serie.overview;
    }

    var seasonSelected = widget._serie.seasons
        .where((i) => i.id == int.parse(_selectedItem))
        .toList();

    await SerieController.getInstance()
        .getSerieVideos(widget._serie.id, seasonSelected[0].seasonNumber);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getSerieVideos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SafeArea(
            child: Scaffold(
              extendBodyBehindAppBar: false,
              appBar: AppBarUniplus(
                widget._user,
                widget._languageCode,
                cor: Colors.black45,
                showLeadingArrow: true,
              ),
              body: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(0, 0, 0),
                      child: Hero(
                        tag: widget._serie.posterPath,
                        child: ClipShadowPath(
                          clipper: CircularClipper(),
                          shadow: Shadow(blurRadius: 20.0),
                          child: Image(
                            height: 500.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                BASE_API_IMAGES + "/w500" + _posterPath),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        PopularidadeWidget(
                            widget._serie.voteAverage, widget._languageCode),
                        Spacer(),
                        LikesWidget(
                            widget._serie.voteCount, widget._languageCode),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        value: _selectedItem,
                        items: getDropDownSeasonsItens(),
                        onChanged: (String selectedItem) {
                          if (selectedItem != _selectedItem) {
                            var seasonSelected = widget._serie.seasons
                                .where((i) => i.id == int.parse(selectedItem))
                                .toList();
                            var posterPath = seasonSelected[0].posterPath ==
                                    null
                                ? widget._serie.posterPath
                                : seasonSelected[0]
                                        .posterPath
                                        .toString()
                                        .isNotEmpty
                                    ? seasonSelected[0].posterPath.toString()
                                    : widget._serie.posterPath.toString();
                            setState(() {
                              _selectedItem = seasonSelected[0].id.toString();
                              _episodiosCount =
                                  seasonSelected[0].episodeCount.toString();
                              _posterPath = posterPath;
                              _overview = seasonSelected[0]
                                      .overview
                                      .toString()
                                      .isNotEmpty
                                  ? seasonSelected[0].overview.toString()
                                  : withoutOverview
                                      .getStringLanguage(widget._languageCode);
                            });
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          episodioCount
                                  .getStringLanguage(widget._languageCode) +
                              _episodiosCount,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Text(
                        widget._serie.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        _overview,
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    PaymentController.getInstance().paymentJsonModel.planDTO ==
                            null
                        ? Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child:
                                SignButton(widget._user, widget._languageCode),
                          )
                        : Container(),
                    PaymentController.getInstance().paymentJsonModel.planDTO !=
                            null
                        ? Container(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              videoLabel
                                  .getStringLanguage(widget._languageCode),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Container(),
                    PaymentController.getInstance().paymentJsonModel.planDTO !=
                            null
                        ? SerieVideoList(widget._languageCode)
                        : Container(),
                  ],
                ),
              ),
            ),
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

  List<DropdownMenuItem<String>> getDropDownSeasonsItens() {
    List<DropdownMenuItem<String>> items = new List();
    for (Seasons season in widget._serie.seasons) {
      items.add(
        new DropdownMenuItem(
          value: season.id.toString(),
          child: Center(
            child: Text(
              season.name,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return items;
  }

  @override
  void dispose() {
    SerieController.getInstance().responseVideo = null;
    super.dispose();
  }
}
