import 'package:crypto_tracker/core/connectivity/i_connectivity_service.dart';
import 'package:crypto_tracker/features/market/domain/usecases/get_market_coins_usecase.dart';
import 'package:crypto_tracker/features/market/domain/usecases/search_coins_usecase.dart';
import 'package:crypto_tracker/features/market/presentation/viewmodel/market_viewmodel.dart';
import 'package:crypto_tracker/features/settings/domain/repositories/i_settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crypto_tracker/core/router/app_routes.dart';
import 'package:crypto_tracker/features/market/presentation/view/market_screen.dart';
import 'package:crypto_tracker/features/portfolio/presentation/view/portfolio_screen.dart';
import 'package:provider/provider.dart';

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
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (context) => MarketViewModel(
              getMarketCoinsUseCase: context.read<GetMarketCoinsUseCase>(),
              searchCoinsUseCase: context.read<SearchCoinsUseCase>(),
              connectivityService: context.read<IConnectivityService>(),
              settingsRepository: context.read<ISettingsRepository>(),
            ),
            child: const MarketScreen(),
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.error}'),
      ),
    ),
  );

  static var instance;
}