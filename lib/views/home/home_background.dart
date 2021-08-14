import 'dart:math';

import 'package:Uniplus/core/api.dart';
import 'package:Uniplus/models/Catalogo/catalogo_model.dart';
import 'package:flutter/material.dart';

class HomeBackground extends StatefulWidget {
  @override
  _HomeBackgroundState createState() => _HomeBackgroundState();
}

class _HomeBackgroundState extends State<HomeBackground> {
  int indexImagem = 0;
  int serie = 0;

  @override
  void initState() {
    Random numeroAleatorio = new Random();
    indexImagem = numeroAleatorio.nextInt(19);
    serie = numeroAleatorio.nextInt(10);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String posterPath;

    if (serie > 5) {
      posterPath = CatalogoModel.getInstance().serieTrendingDay != null
          ? BASE_API_IMAGES +
              "/w500/" +
              CatalogoModel.getInstance()
                  .serieTrendingDay[indexImagem]
                  ?.posterPath
          : "https://image.tmdb.org/t/p/w500/h48Dpb7ljv8WQvVdyFWVLz64h4G.jpg";
    } else {
      posterPath = CatalogoModel.getInstance().moviesTrendingDay != null
          ? BASE_API_IMAGES +
              "/w500/" +
              CatalogoModel.getInstance()
                  .moviesTrendingDay[indexImagem]
                  ?.posterPath
          : "https://image.tmdb.org/t/p/w500/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg";
    }

    return Image.network(
      posterPath,
      fit: BoxFit.fill,
    );
  }
}
