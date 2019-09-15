import 'package:flutter/material.dart';
import 'package:movies_flutter/api/base_urls.dart';
import 'package:movies_flutter/models/movie_details_models.dart';

class TrailerItem extends StatefulWidget {
  final Trailer trailer;

  const TrailerItem(this.trailer);

  @override
  _TrailerItemState createState() => _TrailerItemState();
}

class _TrailerItemState extends State<TrailerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
          '$youtubeImage${widget.trailer.key}$youtubeImagePostfix',
        ),
      )),
    );
  }
}
