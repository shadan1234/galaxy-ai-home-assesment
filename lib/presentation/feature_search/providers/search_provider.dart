import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/providers.dart';
import '../../../domain/entities/pin.dart';

part 'search_provider.g.dart';

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() {
    return '';
  }

  void setQuery(String query) {
    state = query;
  }
}

@riverpod
Future<List<Pin>> searchResults(SearchResultsRef ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return [];

  final repository = ref.watch(pinRepositoryProvider);
  final result = await repository.searchPhotos(query: query);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (pins) => pins,
  );
}
