part of 'pages.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return const MainApp();
      }));
    });
  }

  Widget build(BuildContext context) {
    var image = Image.asset(
      "assets/Frame 2.png",
      height: 150.0,
      width: 150.0,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            const SizedBox(
              height: 20,
            ),
            const Text("Nonton Kuy",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
