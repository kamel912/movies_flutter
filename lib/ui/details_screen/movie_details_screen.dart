import 'package:flutter/material.dart';
import 'package:movies_flutter/api/base_urls.dart';
import 'package:movies_flutter/models/movie.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailsScreen({
    Key key,
    @required this.movie,
  })  : assert(movie != null),
        super(key: key);

  @override
  _MovieDetailsScreenState createState() {
    return _MovieDetailsScreenState();
  }
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          top: false,
          bottom: false,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 300.0,
                  floating: false,
                  pinned: true,
                  elevation: 0.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      "$largePoster${widget.movie.posterPath}",
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      widget.movie.title,
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(margin: EdgeInsets.only(top: 5.0)),
                  Text(
                    widget.movie.title,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 1.0, right: 1.0),
                      ),
                      Text(
                        widget.movie.voteAverage.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      ),
                      Text(
                        widget.movie.releaseDate,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                  Text(
                    widget.movie.overview,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
