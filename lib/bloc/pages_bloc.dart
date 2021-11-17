import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/model/models.dart';

part 'pages_event.dart';
part 'pages_state.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
  PagesBloc() : super(PagesInitial()) {
    on<GoToMainPage>((event, emit) {
      emit(OnMainPage(bottomNavBarIndex: event.bottomNavBarIndex));
    });
    on<GoToMovieDetailPage>((event, emit) {
      emit(OnMovieDetailPage(event.movie, isMovie: event.isMovie));
    });
    on<GoToSearchPage>((event, emit) {
      emit(OnSearchPage(isMovie: event.isMovie));
    });
  }
}
