import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:flutter/material.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/domain/usecases/get_market_coins_usecase.dart';

/// The ViewModel for the Market screen.
///
/// Manages the state of the market data and orchestrates data fetching
/// by delegating to the [GetMarketCoinsUseCase].
class MarketViewModel extends ChangeNotifier {
  final GetMarketCoinsUseCase _getMarketCoinsUseCase;

  MarketViewModel(this._getMarketCoinsUseCase);

  // --- STATE PROPERTIES ---

  bool _isLoading = false;
  /// Whether the ViewModel is currently fetching data.
  bool get isLoading => _isLoading;
  
  List<Coin> _coins = [];
  /// The list of market coins to display.
  List<Coin> get coins => _coins;

  String? _errorMessage;
  /// An error message to display if the data fetch fails.
  String? get errorMessage => _errorMessage;

  // --- PUBLIC METHODS ---

  /// Fetches the list of market coins from the repository.
  ///
  /// Updates the state to reflect loading, success, or failure and
  /// notifies listeners of any changes.
 Future<void> fetchMarketCoins() async {
  _isLoading = true;
  _errorMessage = null;
  notifyListeners();

  final result = await _getMarketCoinsUseCase.execute();

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