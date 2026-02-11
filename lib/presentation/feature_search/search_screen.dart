import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import '../common/shimmer_grid.dart';
import '../feature_home/widgets/pin_card.dart';
import 'providers/search_provider.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(searchResultsProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search for ideas...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                ref.read(searchQueryProvider.notifier).setQuery('');
              },
            ),
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            ref.read(searchQueryProvider.notifier).setQuery(value);
          },
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: searchResults.when(
        data: (pins) {
          if (pins.isEmpty) {
            return const Center(child: Text('Search for something amazing!'));
          }
          return MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: const EdgeInsets.all(8),
            itemCount: pins.length,
            itemBuilder: (context, index) {
              final pin = pins[index];
              return PinCard(pin: pin);
            },
          );
        },
        loading: () => const ShimmerGrid(),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
