import 'dart:async';
import 'package:crypto_tracker/core/localization/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:crypto_tracker/core/connectivity/i_connectivity_service.dart';
import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/features/settings/domain/repositories/i_settings_repository.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/domain/usecases/get_market_coins_usecase.dart';
import 'package:crypto_tracker/features/market/domain/usecases/search_coins_usecase.dart';

/// An enum representing the available sorting options for the market list.
enum MarketSortOption {
  /// Sort by market capitalization, highest to lowest.
  marketCap,

  /// Sort by the highest 24h price percentage change.
  gainers,

  /// Sort by the lowest 24h price percentage change.
  losers,

  /// Sort alphabetically by coin name/id.
  name,
}

extension MarketSortOptionLocalization on MarketSortOption {
  String localized(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    switch (this) {
      case MarketSortOption.marketCap:
        return loc.sortOptionsMarketCap;
      case MarketSortOption.gainers:
        return loc.sortOptionsGainers;
      case MarketSortOption.losers:
        return loc.sortOptionsLosers;
      case MarketSortOption.name:
        return loc.sortOptionsAlphabetic;
    }
  }
}

class MarketViewModel extends ChangeNotifier {
  // --- DEPENDENCIES ---
  final GetMarketCoinsUseCase _getMarketCoinsUseCase;
  final SearchCoinsUseCase _searchCoinsUseCase;
  final IConnectivityService _connectivityService;
  final ISettingsRepository _settingsRepository;

  late final StreamSubscription<bool> _connectivitySub;

  MarketViewModel({
    required GetMarketCoinsUseCase getMarketCoinsUseCase,
    required SearchCoinsUseCase searchCoinsUseCase,
    required IConnectivityService connectivityService,
    required ISettingsRepository settingsRepository,
  }) : _getMarketCoinsUseCase = getMarketCoinsUseCase,
       _searchCoinsUseCase = searchCoinsUseCase,
       _connectivityService = connectivityService,
       _settingsRepository = settingsRepository {
    _connectivitySub = _connectivityService.isOnlineStream.listen(
      (_) => notifyListeners(),
    );
    fetchMarketCoins();
  }

  // --- STATE PROPERTIES ---
  bool _isLoading = false;
  List<Coin> _coins = [];
  String? _errorMessage;
  MarketSortOption _currentSortOption = MarketSortOption.marketCap;
  List<Coin> _marketListCache = []; // In-memory cache for the main market list
  bool _isSearchActive = false;

  bool get isLoading => _isLoading;
  List<Coin> get coins => _coins;
  String? get errorMessage => _errorMessage;
  MarketSortOption get currentSortOption => _currentSortOption;
  final TextEditingController searchController = TextEditingController();
  bool get isSearchActive => _isSearchActive;
  bool get isOnline => _connectivityService.isOnline;
  Timer? _debounce;

  @override
  void dispose() {
    _connectivitySub.cancel();
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  // --- PUBLIC METHODS ---

  /// Toggles the search bar's visibility.
  void toggleSearch() {
    _isSearchActive = !_isSearchActive;
    if (!_isSearchActive) {
      // When closig searnch, clear the query and restore from cache
      searchController.clear();
      onSearchQueryChanged('');
    }
    notifyListeners();
  }

  void changeSortOption(MarketSortOption newSort) {
    if (_currentSortOption == newSort) return;
    _currentSortOption = newSort;
    _sortCoinsByOption(_currentSortOption);
  }

  void onSearchQueryChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    if (query.isEmpty) {
      // Restore from cache if the query is cleared
      if (_marketListCache.isNotEmpty) {
        _coins = _marketListCache;
        _errorMessage = null;
        notifyListeners();
      } else {
        // If the cache is empty for some reason, fetch the main list
        fetchMarketCoins();
      }
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _performSearch(query);
    });
  }

  Future<void> refresh() {
    // We get the latest search query directly from the controller
    if (isSearchActive && searchController.text.isNotEmpty) {
      return _performSearch(searchController.text, isRefresh: true);
    } else {
      return fetchMarketCoins(isRefresh: true);
    }
  }

  Future<void> fetchMarketCoins({bool isRefresh = false}) async {
    if (!isRefresh) {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();
    }

    final currency = 'usd';

    final result = await _getMarketCoinsUseCase.execute(currency: currency);
    if (result is Success<List<Coin>>) {
      _coins = result.value;
      // Cache the main list if we are not in a search context
      if (!isSearchActive) {
        _marketListCache = _coins;
      }
    } else if (result is Failure<List<Coin>>) {
      _coins = [];
      _errorMessage = result.failure.message;
    }
    // Incase user refreshes the page when there's a sort option selected.
    _sortCoinsByOption(_currentSortOption);
    _isLoading = false;
    notifyListeners();
  }

  // --- PRIVATE HELPERS ---

  /// Sorts the provided list of [coins] based on the selected [option].
  /// This is for client-side sorting only (gainers/losers).
  void _sortCoinsByOption(MarketSortOption option) {
    var sortedCoins = _coins;
    switch (option) {
      case MarketSortOption.gainers:
        sortedCoins.sort(
          (a, b) =>
              b.priceChangePercentage24h.compareTo(a.priceChangePercentage24h),
        );
        break;
      case MarketSortOption.losers:
        sortedCoins.sort(
          (a, b) =>
              a.priceChangePercentage24h.compareTo(b.priceChangePercentage24h),
        );
        break;
      case MarketSortOption.marketCap:
        sortedCoins = _marketListCache;
        break;
      case MarketSortOption.name:
        sortedCoins.sort((a, b) => a.symbol.compareTo(b.symbol));
        break;
    }
    _coins = sortedCoins;
    notifyListeners();
  }

  Future<void> _performSearch(String query, {bool isRefresh = false}) async {
    if (!isRefresh) {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();
    }

    // The call is now much simpler. It no longer needs to pass the currency.
    final result = await _searchCoinsUseCase.execute(query);

    if (result is Success<List<Coin>>) {
      _coins = result.value;
    } else if (result is Failure<List<Coin>>) {
      _coins = [];
      _errorMessage = result.failure.message;
    }
    _isLoading = false;
    notifyListeners();
  }
}
