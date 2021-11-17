part of "pages.dart";

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
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
                      context.read<PagesBloc>().add(GoToSearchPage());
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: "Ketik Judul Film",
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
                  child: Text("Movies",
                      style: blackTextFont.copyWith(
                          fontSize: 42, fontWeight: FontWeight.bold))),
              Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: Text("Popular Movies",
                      style: blackTextFont.copyWith(fontSize: 32))),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                height: 200,
                child: BlocBuilder<MoviesBloc, MoviesState>(
                    builder: (context, movieState) {
                  if (movieState is MoviesLoaded) {
                    List<MovieShow> movies = movieState.popularMovies!;

                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.only(
                                  left: (index == 0) ? 24 : 0,
                                  right:
                                      (index == movies.length - 1) ? 24 : 16),
                              child: MovieCard(
                                movies[index],
                                onTap: () {
                                  context.read<MoviesBloc>().add(GetDetailMovie(
                                      movies[index],
                                      "https://api.themoviedb.org/3/movie/${movies[index].id}?api_key=$apiKey&language=en-US"));
                                  context
                                      .read<PagesBloc>()
                                      .add(GoToMovieDetailPage(movies[index]));
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
                child: BlocBuilder<MoviesBloc, MoviesState>(
                    builder: (context, movieState) {
                  if (movieState is MoviesLoaded) {
                    List<MovieShow> movies = movieState.topRatedMovies!;

                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.only(
                                  left: (index == 0) ? 24 : 0,
                                  right:
                                      (index == movies.length - 1) ? 24 : 16),
                              child: MovieCard(movies[index], onTap: () {
                                context.read<MoviesBloc>().add(GetDetailMovie(
                                    movies[index],
                                    "https://api.themoviedb.org/3/movie/${movies[index].id}?api_key=$apiKey&language=en-US"));
                                context
                                    .read<PagesBloc>()
                                    .add(GoToMovieDetailPage(movies[index]));
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
                  child: Text("Now Playing",
                      style: blackTextFont.copyWith(fontSize: 32))),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                height: 180,
                child: BlocBuilder<MoviesBloc, MoviesState>(
                    builder: (context, movieState) {
                  if (movieState is MoviesLoaded) {
                    List<MovieShow> movies = movieState.nowPlayingMovies!;

                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.only(
                                  left: (index == 0) ? 24 : 0,
                                  right:
                                      (index == movies.length - 1) ? 24 : 16),
                              child: MovieCard(movies[index], onTap: () {
                                context.read<MoviesBloc>().add(GetDetailMovie(
                                    movies[index],
                                    "https://api.themoviedb.org/3/movie/${movies[index].id}?api_key=$apiKey&language=en-US"));
                                context
                                    .read<PagesBloc>()
                                    .add(GoToMovieDetailPage(movies[index]));
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
                  child: Text("Upcoming",
                      style: blackTextFont.copyWith(fontSize: 32))),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                height: 180,
                child: BlocBuilder<MoviesBloc, MoviesState>(
                    builder: (context, movieState) {
                  if (movieState is MoviesLoaded) {
                    List<MovieShow> movies = movieState.upcomingMovies!;

                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.only(
                                  left: (index == 0) ? 24 : 0,
                                  right:
                                      (index == movies.length - 1) ? 24 : 16),
                              child: CoomingSoonCard(movies[index], onTap: () {
                                context.read<MoviesBloc>().add(GetDetailMovie(
                                    movies[index],
                                    "https://api.themoviedb.org/3/movie/${movies[index].id}?api_key=$apiKey&language=en-US"));
                                context
                                    .read<PagesBloc>()
                                    .add(GoToMovieDetailPage(movies[index]));
                              }),
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
