part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int? bottomNavBarIndex;
  const MainPage({Key? key, this.bottomNavBarIndex = 0}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int? bottomNavCurrentIndex;
  @override
  void initState() {
    super.initState();
    bottomNavCurrentIndex = widget.bottomNavBarIndex;
  }

  List<Widget> container = [
    const MoviesPage(),
    const TvShowPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: container[bottomNavCurrentIndex!],
        bottomNavigationBar: _buildBottomNavigation());
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          bottomNavCurrentIndex = index;
        });
      },
      currentIndex: bottomNavCurrentIndex!,
      items: [
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.movie,
              color: accentColor1,
            ),
            icon: Icon(
              Icons.movie,
              color: mainColor,
            ),
            label: 'Movies'),
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.tv,
              color: accentColor1,
            ),
            icon: Icon(
              Icons.tv,
              color: mainColor,
            ),
            label: 'TV Show'),
      ],
    );
  }
}
