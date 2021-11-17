part of "models.dart";

class MovieShowDetail extends MovieShow {
  final List<String>? genres;
  final String? language;

  MovieShowDetail(MovieShow movie, {this.genres, this.language})
      : super(
            id: movie.id,
            title: movie.title,
            voteAverage: movie.voteAverage,
            overView: movie.overView,
            posterPath: movie.posterPath,
            backdropPath: movie.backdropPath);
  String get genresAndLanguage {
    String s = "";

    for (var genre in genres!) {
      s += genre + (genre != genres!.last ? ', ' : '');
    }

    return "$s - $language";
  }
}
