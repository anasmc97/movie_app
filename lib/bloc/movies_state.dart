part of 'movies_bloc.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesLoaded extends MoviesState {
  final List<MovieShow>? nowPlayingMovies;
  final List<MovieShow>? topRatedMovies;
  final List<MovieShow>? popularMovies;
  final List<MovieShow>? upcomingMovies;

  MoviesLoaded(
      {this.nowPlayingMovies,
      this.topRatedMovies,
      this.popularMovies,
      this.upcomingMovies});

  @override
  List<Object> get props => throw UnimplementedError();
}

class MovieDetailLoaded extends MoviesState {
  final MovieShowDetail? movie;
  final List<Credit>? credits;

  MovieDetailLoaded({this.movie, this.credits});

  @override
  List<Object> get props => throw UnimplementedError();
}

class MovieSearchedLoaded extends MoviesState {
  List<MovieShow>? searchedMovies;

  MovieSearchedLoaded({this.searchedMovies});

  @override
  List<Object> get props => throw UnimplementedError();
}
