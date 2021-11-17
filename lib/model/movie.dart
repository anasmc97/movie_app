part of 'models.dart';

class MovieShow {
  final int? id;
  final String? title;
  final double? voteAverage;
  final String? overView;
  final String? posterPath;
  final String? backdropPath;
  MovieShow(
      {@required this.id,
      @required this.title,
      @required this.voteAverage,
      @required this.overView,
      @required this.posterPath,
      @required this.backdropPath});

  factory MovieShow.fromJson(Map<String, dynamic> json) => MovieShow(
      id: json['id'],
      title: (json['title'] != null) ? json['title'] : json["name"],
      voteAverage: (json['vote_average'] as num).toDouble(),
      overView: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path']);
}
