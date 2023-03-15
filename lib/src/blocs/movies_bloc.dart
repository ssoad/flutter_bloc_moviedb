import 'package:observable/observable.dart';
import 'package:rxdart/rxdart.dart';

import '../models/itemgroup_model.dart';
import '../resources/repository.dart';

class MoviesBloc {
  final _repository = Repository();
  final _movieFetcher = PublishSubject<ItemGroup>();

  Stream<ItemGroup> get allMovies => _movieFetcher.stream;

  fetchAllMovies() async {
    ItemGroup itemGroup = await _repository.fetchAllMovies();
    _movieFetcher.sink.add(itemGroup);
  }

  dispose() {
    _movieFetcher.close();
  }
}

final bloc = MoviesBloc();
