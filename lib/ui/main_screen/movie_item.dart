import 'package:flutter/material.dart';
import 'package:movies_flutter/api/base_urls.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/ui/details_screen/movie_details_screen.dart';

final _movieHeight = 180.00;
final _movieWidth = 140.00;

class MovieItem extends StatefulWidget {
  final Movie movie;

  const MovieItem({
    Key key,
    @required this.movie,
  })  : assert(movie != null),
        super(key: key);

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) => _buildMovie();

  Widget _buildMovie() => ClipRRect(
        borderRadius: new BorderRadius.circular(8.0),
        child: InkWell(
          onTap: () => _openMovieDetailsScreen(widget.movie),
          child: Container(
            height: _movieHeight,
            width: _movieWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('$smallPoster${widget.movie.posterPath}'),
                fit: BoxFit.cover,
              ),
              color: Colors.blueGrey[900],
            ),
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 75.0,
                    color: Color.fromARGB(150, 0, 0, 0),
                    child: Text(
                      widget.movie.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  _openMovieDetailsScreen(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(
          movie: movie,
        ),
      ),
    );
  }
}
