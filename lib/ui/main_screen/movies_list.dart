import 'package:flutter/material.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/models/response.dart';
import 'package:movies_flutter/ui/main_screen/movie_item.dart';

class MoviesList extends StatelessWidget {
  final String listTitle;
  final BaseResponse<Movie> moviesResponse;

  const MoviesList({
    Key key,
    @required this.listTitle,
    @required this.moviesResponse,
  })  : assert(listTitle != null),
        assert(moviesResponse != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _buildListItem(context);

  Widget _buildListItem(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: EdgeInsets.all(8.00),
        color: Theme.of(context).primaryColor,
        height: 350.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    listTitle,
                    style: TextStyle(
                      fontSize: 25.00,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 300.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: moviesResponse.results.length,
                itemBuilder: (context, index) {
                  return _buildMoviesList(moviesResponse.results[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoviesList(Movie movie) => Container(
        padding: EdgeInsets.all(8.0),
        child: MovieItem(
          movie: movie,
        ),
      );
}
