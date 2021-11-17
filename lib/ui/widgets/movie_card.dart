part of "widgets.dart";

class MovieCard extends StatelessWidget {
  final MovieShow movie;
  final Function? onTap;
  final double height;
  final double width;

  // ignore: prefer_const_constructors_in_immutables
  MovieCard(this.movie,
      {Key? key, this.onTap, this.height = 140, this.width = 210})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: (movie.backdropPath != null)
                  ? NetworkImage(imageBaseUrl + "w780" + movie.backdropPath!)
                  : NetworkImage(imageBaseUrl + "w780" + movie.posterPath!),
              fit: BoxFit.cover),
        ),
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.61),
                    Colors.black.withOpacity(0)
                  ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movie.title ?? "",
                style: GoogleFonts.raleway()
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              RatingStars(
                voteAverage: movie.voteAverage!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
