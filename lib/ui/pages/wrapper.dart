part of 'pages.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesBloc, PagesState>(
        builder: (context, pageState) => (pageState is OnMainPage)
            ? MainPage(bottomNavBarIndex: pageState.bottomNavBarIndex)
            : (pageState is OnMovieDetailPage)
                ? MovieShowDetailPage(
                    pageState.movie,
                    isMovie: pageState.isMovie,
                  )
                : (pageState is OnSearchPage)
                    ? SearchPage(
                        isMovie: pageState.isMovie,
                      )
                    : Container());
  }
}
