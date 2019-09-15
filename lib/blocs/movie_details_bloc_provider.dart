import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:movies_flutter/blocs/movie_details_bloc.dart';
export 'movie_details_bloc.dart';

class MovieDetailsBlocProvider extends InheritedWidget {

  final MovieDetailsBloc bloc;

  @provide
  MovieDetailsBlocProvider(this.bloc);

  @override
  bool updateShouldNotify(_) {

    return true;
  }


  static MovieDetailsBloc of(BuildContext context) {

    return (context.inheritFromWidgetOfExactType(MovieDetailsBlocProvider)

    as MovieDetailsBlocProvider)
        .bloc;
  }
}
