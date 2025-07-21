import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_tracker/features/market/presentation/viewmodel/market_viewmodel.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  void initState() {
    super.initState();
    // Use a post-frame callback to ensure the context is available.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Trigger the initial data fetch. We use `context.read` because we are
      // in a lifecycle method and don't need to listen for changes here.
      context.read<MarketViewModel>().fetchMarketCoins();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use `context.watch` to listen for changes in the ViewModel.
    // The `build` method will re-run whenever `notifyListeners` is called.
    final viewModel = context.watch<MarketViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Market'), // This should be localized later
      ),
      body: _buildBody(viewModel),
    );
  }

  Widget _buildBody(MarketViewModel viewModel) {
    if (viewModel.isLoading && viewModel.coins.isEmpty) {
      // Show a full-screen loader only on the initial load
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(viewModel.errorMessage!),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<MarketViewModel>().fetchMarketCoins(),
              child: const Text('Retry'), // Should be localized
            ),
          ],
        ),
      );
    }

    // If we have data, show it in a list
    return ListView.builder(
      itemCount: viewModel.coins.length,
      itemBuilder: (context, index) {
        final coin = viewModel.coins[index];
        // We will create a dedicated widget for this later.
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(coin.image),
          ),
          title: Text(coin.name),
          subtitle: Text(coin.symbol.toUpperCase()),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${coin.currentPrice.toStringAsFixed(2)}'), // Should use currency formatter
              Text(
                '${coin.priceChangePercentage24h.toStringAsFixed(2)}%',
                style: TextStyle(
                  color: coin.priceChangePercentage24h >= 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}