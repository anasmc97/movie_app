part of 'pages.dart';

class MovieShowDetailPage extends StatelessWidget {
  final MovieShow movie;
  final bool isMovie;
  final bool isUpcoming;

  const MovieShowDetailPage(this.movie,
      {Key? key, this.isUpcoming = false, this.isMovie = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isMovie) {
          context.read<PagesBloc>().add(GoToMainPage());
        } else {
          context.read<PagesBloc>().add(GoToMainPage(bottomNavBarIndex: 1));
        }
        context.read<MoviesBloc>().add(FetchMovies());
        context.read<TvShowBloc>().add(FetchTvShow());
        return false;
      },
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            color: accentColor1,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          ListView(
            children: <Widget>[
              BlocBuilder<MoviesBloc, MoviesState>(
                  builder: (context, movieState) {
                return Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        // note: BACKDROP
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 270,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: (movie.backdropPath != null)
                                          ? NetworkImage(imageBaseUrl +
                                              "w1280" +
                                              movie.backdropPath!)
                                          : NetworkImage(imageBaseUrl +
                                              "w1280" +
                                              movie.posterPath!),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              height: 271,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: const Alignment(0, 1),
                                      end: const Alignment(0, 0.06),
                                      colors: [
                                    Colors.white,
                                    Colors.white.withOpacity(0)
                                  ])),
                            )
                          ],
                        ),
                        // note: BACK ICON
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, left: defaultMargin),
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black.withOpacity(0.04)),
                          child: GestureDetector(
                            onTap: () {
                              if (isMovie) {
                                context.read<PagesBloc>().add(GoToMainPage());
                              } else {
                                context
                                    .read<PagesBloc>()
                                    .add(GoToMainPage(bottomNavBarIndex: 1));
                              }
                              context.read<MoviesBloc>().add(FetchMovies());
                              context.read<TvShowBloc>().add(FetchTvShow());
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    // note: JUDUL
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                          defaultMargin, 16, defaultMargin, 6),
                      child: Text(
                        movie.title ?? "",
                        textAlign: TextAlign.center,
                        style: blackTextFont.copyWith(fontSize: 24),
                      ),
                    ),
                    // note: GENRE
                    (movieState is MovieDetailLoaded)
                        ? Text(
                            movieState.movie!.genresAndLanguage,
                            style: greyTextFont.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          )
                        : SizedBox(
                            height: 50,
                            width: 50,
                            child: SpinKitFadingCircle(
                              color: accentColor1,
                            ),
                          ),
                    const SizedBox(
                      height: 6,
                    ),
                    // note: RATING
                    (isUpcoming == false)
                        ? RatingStars(
                            voteAverage: movie.voteAverage,
                            color: accentColor3,
                            alignment: MainAxisAlignment.center,
                          )
                        : Container(),
                    const SizedBox(
                      height: 24,
                    ),
                    // note: CREDITS
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          margin: const EdgeInsets.only(
                              left: defaultMargin, bottom: 12),
                          child: Text(
                            "Cast & Crew",
                            style: blackTextFont.copyWith(fontSize: 14),
                          )),
                    ),
                    ((movieState is MovieDetailLoaded))
                        ? SizedBox(
                            height: 115,
                            //menampilkan cast
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: movieState.credits!.length,
                                itemBuilder: (_, index) => Container(
                                    margin: EdgeInsets.only(
                                        left: (index == 0) ? defaultMargin : 0,
                                        right: (index ==
                                                movieState.credits!.length - 1)
                                            ? defaultMargin
                                            : 16),
                                    child: CreditCard(
                                        movieState.credits![index]))),
                          )
                        : SizedBox(
                            height: 50,
                            child: SpinKitFadingCircle(
                              color: accentColor1,
                            )),
                    // note: STORYLINE
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                          defaultMargin, 24, defaultMargin, 8),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Storyline",
                          style: blackTextFont,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                          defaultMargin, 0, defaultMargin, 30),
                      child: Text(
                        movie.overView ?? "",
                        style:
                            greyTextFont.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ],
      )),
    );
  }
}
