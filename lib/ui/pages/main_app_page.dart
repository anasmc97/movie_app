part of 'pages.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MoviesBloc()..add(FetchMovies())),
        BlocProvider(create: (_) => TvShowBloc()..add(FetchTvShow())),
        BlocProvider(create: (_) => PagesBloc()..add(GoToMainPage())),
      ],
      child:
          const MaterialApp(debugShowCheckedModeBanner: false, home: Wrapper()),
    );
  }
}
