part of "services.dart";

class MovieTvShowServices {
  static Future<List<MovieShow>> getMoviesTvShow(String urlAPI,
      {http.Client? client}) async {
    Uri url = Uri.parse(urlAPI);

    client ??= http.Client();

    var response = await client.get(url);
    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];

    return result.map((e) => MovieShow.fromJson(e)).toList();
  }

  static Future<List<MovieShow>> searchMoviesTvShow(String urlAPI,
      {http.Client? client}) async {
    Uri url = Uri.parse(urlAPI);

    client ??= http.Client();

    var response = await client.get(url);
    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];

    return result.map((e) => MovieShow.fromJson(e)).toList();
  }

  static Future<MovieShowDetail> getDetails(MovieShow movie, String urlAPI,
      {int? movieID, http.Client? client}) async {
    Uri url = Uri.parse(urlAPI);
    // Uri url = Uri.parse(
    //     "https://api.themoviedb.org/3/movie/${movieID ?? movie.id}?api_key=$apiKey&language=en-US");

    client ??= http.Client();

    var response = await client.get(url);
    var data = json.decode(response.body);
    List genres = (data as Map<String, dynamic>)['genres'];
    String? language;

    switch ((data as Map<String, dynamic>)['original_language'].toString()) {
      case 'ja':
        language = "Japanese";
        break;
      case 'id':
        language = "Indonesian";
        break;
      case 'ko':
        language = "Korean";
        break;
      case 'en':
        language = "English";
        break;
    }

    return movieID != null
        ? MovieShowDetail(MovieShow.fromJson(data),
            language: language,
            genres: genres
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList())
        : MovieShowDetail(movie,
            language: language,
            genres: genres
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList());
  }

  static Future<List<Credit>> getCredits(String urlAPI,
      {http.Client? client}) async {
    Uri url = Uri.parse(urlAPI);
    // Uri url = Uri.parse(
    //     "https://api.themoviedb.org/3/movie/$movieID/credits?api_key=$apiKey");

    client ??= http.Client();

    var response = await client.get(url);
    var data = json.decode(response.body);

    return ((data as Map<String, dynamic>)['cast'] as List)
        .map((e) => Credit(
            name: (e as Map<String, dynamic>)['name'],
            profilePath: (e as Map<String, dynamic>)['profile_path']))
        .take(8)
        .toList();
  }
}
