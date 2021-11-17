import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/model/models.dart';
import 'package:movie_app/services/services.dart';
import 'package:movie_app/shared/shared.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<FetchMovies>((event, emit) async {
      List<MovieShow> popularMovies = await MovieTvShowServices.getMoviesTvShow(
          "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1");
      List<MovieShow> upcomingMovies = await MovieTvShowServices.getMoviesTvShow(
          "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=1");
      List<MovieShow> nowPlayingMovies = await MovieTvShowServices.getMoviesTvShow(
          "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US&page=1");
      List<MovieShow> topRatedMovies = await MovieTvShowServices.getMoviesTvShow(
          "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1");

      emit(MoviesLoaded(
          nowPlayingMovies: nowPlayingMovies,
          popularMovies: popularMovies,
          topRatedMovies: topRatedMovies,
          upcomingMovies: upcomingMovies));
    });

    on<GetMovieSearched>((event, emit) async {
      if (event.isMovie) {
        List<MovieShow> searchedMovies = await MovieTvShowServices.getMoviesTvShow(
            "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&query=${event.query}&page=1&include_adult=true&year=2021");

        emit(MovieSearchedLoaded(searchedMovies: searchedMovies));
      } else {
        List<MovieShow> searchedTvShow = await MovieTvShowServices.getMoviesTvShow(
            "https://api.themoviedb.org/3/search/tv?api_key=$apiKey&language=en-US&page=1&query=${event.query}&include_adult=true&first_air_date_year=2010");

        emit(MovieSearchedLoaded(searchedMovies: searchedTvShow));
      }
    });

    on<GetDetailMovie>((event, emit) async {
      MovieShowDetail? movie =
          await MovieTvShowServices.getDetails(event.movie, event.UrlAPI);
      if (event.isMovie) {
        List<Credit>? credits = await MovieTvShowServices.getCredits(
            "https://api.themoviedb.org/3/movie/${event.movie.id}/credits?api_key=$apiKey");
        emit(MovieDetailLoaded(movie: movie, credits: credits));
      } else {
        List<Credit>? credits = await MovieTvShowServices.getCredits(
            "https://api.themoviedb.org/3/tv/${event.movie.id}/credits?api_key=$apiKey");
        emit(MovieDetailLoaded(movie: movie, credits: credits));
      }
    });
  }
}
