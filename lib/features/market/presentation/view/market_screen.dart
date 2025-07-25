import 'package:crypto_tracker/common/utils/number_utils.dart';
import 'package:crypto_tracker/core/localization/l10n/app_localizations.dart';
import 'package:crypto_tracker/core/localization/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_tracker/features/market/domain/models/coin_model.dart';
import 'package:crypto_tracker/features/market/domain/usecases/get_market_coins_usecase.dart';
import 'package:crypto_tracker/features/market/presentation/viewmodel/market_viewmodel.dart';
import 'package:crypto_tracker/common/widgets/error_display.dart';
import 'package:crypto_tracker/core/theme/app_theme.dart';
import 'package:crypto_tracker/common/utils/app_paddings.dart';

// Import the private widgets as parts
part 'widgets/market_list_item.dart';
part 'widgets/sort_option_tile.dart';
part 'widgets/sort_options_sheet.dart';

/// The main screen for displaying the cryptocurrency market list.
///
/// This is a "dumb" widget that is driven entirely by the [MarketViewModel].
class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MarketViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: viewModel.isSearchActive
            ? TextField(
                controller:
                    viewModel.searchController, // Use controller from ViewModel
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search coins...', // Should be localized
                  border: InputBorder.none,
                ),
                onChanged:
                    viewModel.onSearchQueryChanged, // Call method on ViewModel
              )
            : const Text('Market'), // Should be localized
        actions: [
          IconButton(
            onPressed: viewModel.toggleSearch, // Call method on ViewModel
            icon: Icon(viewModel.isSearchActive ? Icons.close : Icons.search),
          ),
          if (!viewModel.isSearchActive)
            IconButton(
              onPressed: () => _showSortOptions(context, viewModel),
              icon: const Icon(Icons.sort),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: viewModel.refresh, // Call method on ViewModel
        child: _Body(),
      ),
    );
  }

  void _showSortOptions(BuildContext context, MarketViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      builder: (_) => _SortOptionsSheet(
        changeSortFunction: viewModel.changeSortOption,
        currentSortOption: viewModel.currentSortOption,
      ),
    );
  }
}

/// The main body of the MarketScreen, handling loading, error, and data states.
class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MarketViewModel>();
    if (viewModel.isLoading && viewModel.coins.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.errorMessage != null) {
      return ErrorDisplay(
        message: viewModel.errorMessage!,
        onRetry: viewModel.refresh,
      );
    }

    if (viewModel.coins.isEmpty && !viewModel.isLoading) {
      return const Center(
        child: Text("No coins found."),
      ); // Should be localized
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: AppPaddings.xs),
      itemCount: viewModel.coins.length,
      itemBuilder: (context, index) {
        final coin = viewModel.coins[index];
        return _MarketListItem(coin: coin, onTap: () {});
      },
    );
  }
}


