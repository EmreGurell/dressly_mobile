import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/router/app_routes.dart';
import 'package:ai_try_on/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:ai_try_on/features/feed/presentation/bloc/feed_event.dart';
import 'package:ai_try_on/shared/theme/theme.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(AppRoutes.brands)) return 2;
    if (location.startsWith(AppRoutes.saved)) return 1;
    if (location.startsWith(AppRoutes.profile)) return 3;
    return 0;
  }

  void _onTap(BuildContext context, int currentIndex, int tappedIndex) {
    if (tappedIndex == 0 && currentIndex == 0) {
      sl<FeedBloc>().add(const FeedEvent.refreshFeed());
      return;
    }
    switch (tappedIndex) {
      case 0:
        context.go(AppRoutes.feed);
      case 1:
        context.go(AppRoutes.saved);
      case 2:
        context.go(AppRoutes.brands);
      case 3:
        context.go(AppRoutes.profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = _currentIndex(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: SizedBox(
        height: AppSizes.bottomNavHeight + MediaQuery.of(context).padding.bottom,
        child: BottomNavigationBar(showUnselectedLabels: false,
      showSelectedLabels: false,
        currentIndex: index,
        onTap: (i) => _onTap(context, index, i),
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        backgroundColor: Theme.of(context).colorScheme.surface,
        
        items: [
          BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIcons.house()),
            activeIcon:
                PhosphorIcon(PhosphorIcons.house(PhosphorIconsStyle.fill)),
            label: 'Feed',
          ),BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIcons.bookmarkSimple()),
            activeIcon:
                PhosphorIcon(PhosphorIcons.bookmarkSimple(PhosphorIconsStyle.fill)),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIcons.storefront()),
            activeIcon:
                PhosphorIcon(PhosphorIcons.storefront(PhosphorIconsStyle.fill)),
            label: 'Brands',
          ),
          
          BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIcons.user()),
            activeIcon:
                PhosphorIcon(PhosphorIcons.user(PhosphorIconsStyle.fill)),
            label: 'Profile',
          ),
        ],
      ),
      ),
    );
  }
}
