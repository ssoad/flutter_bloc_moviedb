import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;

import '../models/itemgroup_model.dart';

class MovieApiProvider {
  Client client = Client();
  final String _API_KEY = "8cece1878e4ac3327e30649bd1317d32";

  Future<ItemGroup> fetchMovieList() async {
    final response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=$_API_KEY"));
    if (response.statusCode == 200) {
      return ItemGroup.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
