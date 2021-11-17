part of 'pages_bloc.dart';

@immutable
abstract class PagesEvent {}

class GoToMainPage extends PagesEvent {
  final int bottomNavBarIndex;
  GoToMainPage({this.bottomNavBarIndex = 0});
}

class GoToMovieDetailPage extends PagesEvent {
  final MovieShow movie;
  final bool isMovie;
  GoToMovieDetailPage(this.movie, {this.isMovie = true});
}

class GoToSearchPage extends PagesEvent {
  final bool isMovie;
  GoToSearchPage({this.isMovie = true});
}
