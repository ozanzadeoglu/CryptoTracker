import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crypto_tracker/core/router/app_routes.dart';
import 'package:crypto_tracker/features/market/presentation/view/market_screen.dart';
import 'package:crypto_tracker/features/portfolio/presentation/view/portfolio_screen.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.portfolio, // The landing page
    routes: [
      GoRoute(
        path: AppRoutes.portfolio,
        name: AppRoutes.portfolioName,
        builder: (context, state) => const PortfolioScreen(),
      ),
      GoRoute(
        path: AppRoutes.market,
        name: AppRoutes.marketName,
        builder: (context, state) => const MarketScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.error}'),
      ),
    ),
  );
}