import 'package:crypto_tracker/common/utils/app_paddings.dart';
import 'package:crypto_tracker/common/utils/number_utils.dart';
import 'package:crypto_tracker/core/localization/l10n/app_localizations.dart';
import 'package:crypto_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crypto_tracker/core/router/app_routes.dart';
import 'package:intl/intl.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: AppPaddings.md),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.portfolio,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const PortfolioSummary(
                amount: 2124.15,
                currencyCode: "usd",
                locale: "en",
              ),
              const ProfitLossIndicator(
                currentAssetWorth: 140,
                comparedValue: 120,
                currencyCode: 'TRY',
                locale: 'tr_TR',
              ),

              const SizedBox(height: 40),
              const Text('Portfolio Screen (Placeholder)'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.marketName);
                },
                child: const Text('Go to Market Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfitLossIndicator extends StatelessWidget {
  /// The current, most recent value of the users assets.
  final double currentAssetWorth;

  /// The previous value to compare against (e.g., from 24 hours ago).
  final double comparedValue;

  /// The currency code for formatting (e.g., 'try', 'usd').
  final String currencyCode;

  /// The locale for formatting (e.g., 'tr', 'en').
  final String locale;

  const ProfitLossIndicator({
    super.key,
    required this.currentAssetWorth,
    required this.comparedValue,
    required this.currencyCode,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final double difference = currentAssetWorth - comparedValue;

    final double percentageChange = (comparedValue == 0)
        ? 0.0
        : (difference / comparedValue);

    final Color displayColor;
    if (difference > 0) {
      displayColor = AppColors.success;
    } else if (difference < 0) {
      displayColor = AppColors.dangerPrimary;
    } else {
      displayColor = AppColors.textGray;
    }

    final String formattedDifference = formatCurrency(
      value: difference.abs(),
      currencyCode: currencyCode,
      locale: locale,
    );

    final String formattedPercentage = NumberFormat.decimalPercentPattern(
      locale: locale,
      decimalDigits: 2,
    ).format(percentageChange);

    final String displayString = '$formattedDifference ($formattedPercentage)';

    return Text(
      displayString,
      style: TextStyle(
        color: displayColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class PortfolioSummary extends StatelessWidget {
  final num amount;
  final String currencyCode;
  final String locale;

  const PortfolioSummary({
    super.key,
    required this.amount,
    required this.currencyCode,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> networthParts = formatAndDisassembleCurrency(
      value: amount,
      currencyCode: currencyCode,
      locale: locale,
    );

    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: networthParts[0],
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: networthParts[1],
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          ),
          TextSpan(
            text: networthParts[2],
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.textLightGray,
            ),
          ),
        ],
      ),
    );
  }
}
