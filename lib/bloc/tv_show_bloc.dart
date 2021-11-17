import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/model/models.dart';
import 'package:movie_app/services/services.dart';
import 'package:movie_app/shared/shared.dart';

part 'tv_show_event.dart';
part 'tv_show_state.dart';

class TvShowBloc extends Bloc<TvShowEvent, TvShowState> {
  TvShowBloc() : super(TvShowInitial()) {
    on<FetchTvShow>((event, emit) async {
      List<MovieShow> popularTvShow = await MovieTvShowServices.getMoviesTvShow(
          "https://api.themoviedb.org/3/tv/popular?api_key=$apiKey&language=en-US&page=1");
      List<MovieShow> onTheAirTvShow = await MovieTvShowServices.getMoviesTvShow(
          "https://api.themoviedb.org/3/tv/on_the_air?api_key=$apiKey&language=en-US&page=1");
      List<MovieShow> airingTodayTvShow = await MovieTvShowServices.getMoviesTvShow(
          "https://api.themoviedb.org/3/tv/airing_today?api_key=$apiKey&language=en-US&page=1");
      List<MovieShow> topRatedTvShow = await MovieTvShowServices.getMoviesTvShow(
          "https://api.themoviedb.org/3/tv/top_rated?api_key=$apiKey&language=en-US&page=1");

      emit(TvShowLoaded(
          airingTodayTvShow: airingTodayTvShow,
          popularTvShow: popularTvShow,
          topRatedTvShow: topRatedTvShow,
          onTheAirTvShow: onTheAirTvShow));
    });

    on<GetDetailTvShow>((event, emit) async {
      MovieShowDetail? tvShow =
          await MovieTvShowServices.getDetails(event.tvShow, event.UrlAPI);
      List<Credit>? credits = await MovieTvShowServices.getCredits(
          "https://api.themoviedb.org/3/movie/${event.tvShow.id}/credits?api_key=$apiKey");
      emit(TvShowDetailLoaded(tvShow: tvShow, credits: credits));
    });
  }
}
