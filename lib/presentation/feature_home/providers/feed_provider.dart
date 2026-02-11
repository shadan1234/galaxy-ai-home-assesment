import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/providers.dart';
import '../../../domain/entities/pin.dart';

part 'feed_provider.g.dart';

@riverpod
class Feed extends _$Feed {
  int _page = 1;
  final int _perPage = 15;
  bool _isLoadingMore = false;

  @override
  FutureOr<List<Pin>> build() async {
    _page = 1;
    final repository = ref.watch(pinRepositoryProvider);
    final result = await repository.getCuratedPhotos(page: _page, perPage: _perPage);
    
    return result.fold(
      (failure) => throw Exception(failure.message),
      (pins) => pins,
    );
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || state.isLoading || state.hasError) return;

    _isLoadingMore = true;
    final repository = ref.read(pinRepositoryProvider);
    final nextPage = _page + 1;

    final result = await repository.getCuratedPhotos(page: nextPage, perPage: _perPage);

    result.fold(
      (failure) {
        // Handle error for load more silently or show snackbar via listener
        _isLoadingMore = false;
      },
      (newPins) {
        if (newPins.isNotEmpty) {
          _page = nextPage;
          final currentPins = state.value ?? [];
          state = AsyncValue.data([...currentPins, ...newPins]);
        }
        _isLoadingMore = false;
      },
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    ref.invalidateSelf();
    await future;
  }
}
