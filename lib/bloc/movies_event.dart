part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {}

class FetchMovies extends MoviesEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class GetDetailMovie extends MoviesEvent {
  MovieShow movie;
  String UrlAPI;
  bool isMovie;
  GetDetailMovie(this.movie, this.UrlAPI, {this.isMovie = true});
  @override
  List<Object> get props => throw UnimplementedError();
}

class GetMovieSearched extends MoviesEvent {
  bool isMovie;
  String query;
  GetMovieSearched(this.query, {this.isMovie = true});
  @override
  List<Object> get props => throw UnimplementedError();
}
