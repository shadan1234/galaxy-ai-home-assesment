import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../feature_home/providers/feed_provider.dart';
import '../feature_home/widgets/pin_card.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedState = ref.watch(feedProvider);

    return Scaffold(
      backgroundColor: Colors.black, // Dark mode
      body: DefaultTabController(
        length: 3, // Pins, Boards, Collages
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                elevation: 0,
                pinned: true,
                leadingWidth: 50,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    backgroundImage: null, // User image
                    backgroundColor: Colors.grey[800],
                    child: const Text('J', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.share, color: Colors.white)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz, color: Colors.white)), // Hexagon usually, but more_horiz strictly
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    // Main Profile Info
                    CircleAvatar(
                      radius: 54,
                      backgroundColor: Colors.grey[800],
                      child: const Text('J', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Jane Doe',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '@janedoe123',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 24),
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search your pins',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                          filled: true,
                          fillColor: Colors.grey[900],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.white,
                    indicatorWeight: 3,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                       Tab(text: 'Pins'),
                       Tab(text: 'Boards'),
                       Tab(text: 'Collages'),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              // Pins Tab (All Pins)
              feedState.when(
                data: (pins) => CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: SliverLayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.crossAxisExtent <= 0) {
                            return const SliverToBoxAdapter(child: SizedBox.shrink());
                          }
                          return SliverMasonryGrid.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childCount: pins.length,
                            itemBuilder: (context, index) {
                              final pin = pins[index];
                              return PinCard(pin: pin);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                error: (e, s) => Center(child: Text('Error: $e', style: const TextStyle(color: Colors.white))),
                loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
              ),
              
              // Boards Tab - Placeholder
              const Center(child: Text('You have no boards yet', style: TextStyle(color: Colors.grey))),
              
              // Collages Tab - Placeholder
              const Center(child: Text('No collages created', style: TextStyle(color: Colors.grey))),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  const _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
