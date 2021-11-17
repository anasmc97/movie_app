part of 'tv_show_bloc.dart';

@immutable
abstract class TvShowState {}

class TvShowInitial extends TvShowState {}

class TvShowLoaded extends TvShowState {
  final List<MovieShow>? airingTodayTvShow;
  final List<MovieShow>? topRatedTvShow;
  final List<MovieShow>? popularTvShow;
  final List<MovieShow>? onTheAirTvShow;

  TvShowLoaded(
      {this.airingTodayTvShow,
      this.topRatedTvShow,
      this.popularTvShow,
      this.onTheAirTvShow});

  @override
  List<Object> get props => throw UnimplementedError();
}

class TvShowDetailLoaded extends TvShowState {
  final MovieShowDetail? tvShow;
  final List<Credit>? credits;

  TvShowDetailLoaded({this.tvShow, this.credits});

  @override
  List<Object> get props => throw UnimplementedError();
}
