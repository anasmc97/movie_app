part of 'pages_bloc.dart';

@immutable
abstract class PagesState {}

class PagesInitial extends PagesState {}

class OnMainPage extends PagesState {
  final int bottomNavBarIndex;
  OnMainPage({this.bottomNavBarIndex = 0});
}

class OnMovieDetailPage extends PagesState {
  final MovieShow movie;
  final bool isMovie;
  OnMovieDetailPage(this.movie, {this.isMovie = true});
}

class OnSearchPage extends PagesState {
  final bool isMovie;
  OnSearchPage({this.isMovie = true});
}
