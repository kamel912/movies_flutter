import 'package:flutter/material.dart';
import 'package:movies_flutter/blocs/movies_bloc.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/models/response.dart';
import 'package:movies_flutter/ui/main_screen/movies_list.dart';
import 'package:inject/inject.dart';

class MainScreen extends StatefulWidget {
  final MoviesBloc moviesBloc;

  @provide
  MainScreen(this.moviesBloc);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _titlesList = [
    "Popular",
    "Top rated",
    "Upcoming",
    "Now playing",
  ];

  @override
  void initState() {
    super.initState();
    widget.moviesBloc.getMovies();
  }

  @override
  void dispose() {
    widget.moviesBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainList();
  }

  Widget _buildMainList() {
    return StreamBuilder<Object>(
      stream: widget.moviesBloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<BaseResponse<Movie>> moviesLists =
              snapshot.data as List<BaseResponse<Movie>>;
          return ListView.builder(
            itemCount: moviesLists.length,
            itemBuilder: (context, index) {
              return _buildMoviesListWidget(
                _titlesList[index],
                moviesLists[index],
              );
            },
          );
        } else if (snapshot.hasError) {
          print(snapshot.error.toString());
          return _buildErrorWidget(snapshot.error.toString());
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildMoviesListWidget(String listTitle, BaseResponse<Movie> data) {
    return MoviesList(
      listTitle: listTitle,
      moviesResponse: data,
    );
  }

  Widget _buildErrorWidget(String error) {
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error occured: $error"),
        ],
      )),
    );
  }

  Widget _buildLoadingWidget() {
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: Center(
        child: CircularProgressIndicator(
//          backgroundColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
