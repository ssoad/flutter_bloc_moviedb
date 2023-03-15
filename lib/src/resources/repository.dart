import 'dart:async';

import '../models/itemgroup_model.dart';
import 'movie_api_provider.dart';


class Repository {
  
  final movieApiProvider = MovieApiProvider();

  Future<ItemGroup> fetchAllMovies() => movieApiProvider.fetchMovieList();
}