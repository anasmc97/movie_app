part of 'widgets.dart';

class CoomingSoonCard extends StatelessWidget {
  final MovieShow movie;
  final Function? onTap;

  const CoomingSoonCard(this.movie, {Key? key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        height: 160,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(imageBaseUrl + "w500" + movie.posterPath!),
                fit: BoxFit.cover)),
      ),
    );
  }
}
