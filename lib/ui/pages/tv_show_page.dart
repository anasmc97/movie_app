part of "pages.dart";

class TvShowPage extends StatefulWidget {
  const TvShowPage({Key? key}) : super(key: key);

  @override
  _TvShowPageState createState() => _TvShowPageState();
}

class _TvShowPageState extends State<TvShowPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      context.read<MoviesBloc>().add(GetMovieSearched(value));
                      context
                          .read<PagesBloc>()
                          .add(GoToSearchPage(isMovie: false));
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: "Ketik Judul Tv Show",
                      hintStyle: greyTextFont,
                      prefixIcon: const Visibility(
                        visible: true,
                        child: Icon(Icons.search),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: Text("Tv Show",
                      style: blackTextFont.copyWith(
                          fontSize: 42, fontWeight: FontWeight.bold))),
              Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: Text("Popular Tv Show",
                      style: blackTextFont.copyWith(fontSize: 32))),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                height: 200,
                child: BlocBuilder<TvShowBloc, TvShowState>(
                    builder: (context, tvShowState) {
                  if (tvShowState is TvShowLoaded) {
                    List<MovieShow> tvShow = tvShowState.popularTvShow!;

                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tvShow.length,
                        itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.only(
                                  left: (index == 0) ? 24 : 0,
                                  right:
                                      (index == tvShow.length - 1) ? 24 : 16),
                              child: MovieCard(
                                tvShow[index],
                                onTap: () {
                                  context.read<MoviesBloc>().add(GetDetailMovie(
                                      tvShow[index],
                                      "https://api.themoviedb.org/3/tv/${tvShow[index].id}?api_key=$apiKey&language=en-US",
                                      isMovie: false));
                                  context.read<PagesBloc>().add(
                                      GoToMovieDetailPage(tvShow[index],
                                          isMovie: false));
                                },
                                width: 230,
                              ),
                            ));
                  } else {
                    return SpinKitFadingCircle(
                      color: accentColor1,
                      size: 50,
                    );
                  }
                }),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: Text("Top Rated",
                      style: blackTextFont.copyWith(fontSize: 32))),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                height: 180,
                child: BlocBuilder<TvShowBloc, TvShowState>(
                    builder: (context, tvShowState) {
                  if (tvShowState is TvShowLoaded) {
                    List<MovieShow> tvShow = tvShowState.topRatedTvShow!;

                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tvShow.length,
                        itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.only(
                                  left: (index == 0) ? 24 : 0,
                                  right:
                                      (index == tvShow.length - 1) ? 24 : 16),
                              child: MovieCard(tvShow[index], onTap: () {
                                context.read<MoviesBloc>().add(GetDetailMovie(
                                    tvShow[index],
                                    "https://api.themoviedb.org/3/tv/${tvShow[index].id}?api_key=$apiKey&language=en-US",
                                    isMovie: false));
                                context.read<PagesBloc>().add(
                                    GoToMovieDetailPage(tvShow[index],
                                        isMovie: false));
                              }, width: 180),
                            ));
                  } else {
                    return SpinKitFadingCircle(
                      color: accentColor1,
                      size: 50,
                    );
                  }
                }),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: Text("Airing Today",
                      style: blackTextFont.copyWith(fontSize: 32))),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                height: 180,
                child: BlocBuilder<TvShowBloc, TvShowState>(
                    builder: (context, tvShowState) {
                  if (tvShowState is TvShowLoaded) {
                    List<MovieShow> tvShow = tvShowState.airingTodayTvShow!;

                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tvShow.length,
                        itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.only(
                                  left: (index == 0) ? 24 : 0,
                                  right:
                                      (index == tvShow.length - 1) ? 24 : 16),
                              child: MovieCard(tvShow[index], onTap: () {
                                context.read<MoviesBloc>().add(GetDetailMovie(
                                    tvShow[index],
                                    "https://api.themoviedb.org/3/tv/${tvShow[index].id}?api_key=$apiKey&language=en-US",
                                    isMovie: false));
                                context.read<PagesBloc>().add(
                                    GoToMovieDetailPage(tvShow[index],
                                        isMovie: false));
                              }, width: 180),
                            ));
                  } else {
                    return SpinKitFadingCircle(
                      color: accentColor1,
                      size: 50,
                    );
                  }
                }),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: Text("On The Air",
                      style: blackTextFont.copyWith(fontSize: 32))),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                height: 180,
                child: BlocBuilder<TvShowBloc, TvShowState>(
                    builder: (context, tvShowState) {
                  if (tvShowState is TvShowLoaded) {
                    List<MovieShow> tvShow = tvShowState.onTheAirTvShow!;

                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tvShow.length,
                        itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.only(
                                  left: (index == 0) ? 24 : 0,
                                  right:
                                      (index == tvShow.length - 1) ? 24 : 16),
                              child: MovieCard(tvShow[index], onTap: () {
                                context.read<MoviesBloc>().add(GetDetailMovie(
                                    tvShow[index],
                                    "https://api.themoviedb.org/3/tv/${tvShow[index].id}?api_key=$apiKey&language=en-US",
                                    isMovie: false));
                                context.read<PagesBloc>().add(
                                    GoToMovieDetailPage(tvShow[index],
                                        isMovie: false));
                              }, width: 180),
                            ));
                  } else {
                    return SpinKitFadingCircle(
                      color: accentColor1,
                      size: 50,
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
