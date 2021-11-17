part of 'pages.dart';

class SearchPage extends StatefulWidget {
  bool isMovie;
  SearchPage({Key? key, this.isMovie = true}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.isMovie) {
          context.read<PagesBloc>().add(GoToMainPage());
        } else {
          context.read<PagesBloc>().add(GoToMainPage(bottomNavBarIndex: 1));
        }
        context.read<MoviesBloc>().add(FetchMovies());
        context.read<TvShowBloc>().add(FetchTvShow());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black.withOpacity(0.04)),
                        child: GestureDetector(
                          onTap: () {
                            if (widget.isMovie) {
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
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 100,
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            context
                                .read<MoviesBloc>()
                                .add(GetMovieSearched(value));
                            context.read<PagesBloc>().add(GoToSearchPage());
                          },
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            hintText: (widget.isMovie)
                                ? "Ketik Judul Film"
                                : "Ketik Judul Tv Show",
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
                    ],
                  ),
                ),
                BlocBuilder<MoviesBloc, MoviesState>(
                  builder: (context, state) {
                    if (state is MovieSearchedLoaded) {
                      List<MovieShow> searchedMovies = state.searchedMovies!;
                      if (searchedMovies.isEmpty) {
                        return const Center(
                            child:
                                Text("Judul yang anda cari tidak ditemukan"));
                      }
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: searchedMovies.length,
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            context.read<MoviesBloc>().add(GetDetailMovie(
                                state.searchedMovies![index],
                                "https://api.themoviedb.org/3/movie/${state.searchedMovies![index].id}?api_key=$apiKey&language=en-US"));
                            context.read<PagesBloc>().add(GoToMovieDetailPage(
                                state.searchedMovies![index]));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: index == 0 ? 0 : 20, left: 20),
                            child: Row(
                              //poster dan detailmovie
                              children: <Widget>[
                                Container(
                                  //gambar poster
                                  width: 70,
                                  height: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: (searchedMovies[index]
                                                      .posterPath !=
                                                  null)
                                              ? NetworkImage(imageBaseUrl +
                                                  'w500' +
                                                  searchedMovies[index]
                                                      .posterPath!)
                                              : const NetworkImage(
                                                  "https://media.istockphoto.com/vectors/play-button-icon-vector-id1194415465?b=1&k=20&m=1194415465&s=612x612&w=0&h=RfgPV67AKqBOlPCs09RN5j34xJiF_Lw37DvV8fksTYc="),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(width: 16),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width -
                                      2 * defaultMargin -
                                      70 -
                                      16,
                                  child: Column(
                                    //detail movie
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        searchedMovies[index].title ?? "",
                                        style: blackTextFont.copyWith(
                                            fontSize: 18),
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SpinKitFadingCircle(
                        color: accentColor1,
                        size: 50,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
