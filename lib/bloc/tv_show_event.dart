part of 'tv_show_bloc.dart';

@immutable
abstract class TvShowEvent {}

class FetchTvShow extends TvShowEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class GetDetailTvShow extends TvShowEvent {
  MovieShow tvShow;
  String UrlAPI;
  GetDetailTvShow(this.tvShow, this.UrlAPI);
  @override
  List<Object> get props => throw UnimplementedError();
}
