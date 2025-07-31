part of '../market_screen.dart';

/// A private widget to display a single row in the market list.
class _MarketListItem extends StatelessWidget {
  final Coin coin;
  final VoidCallback onTap;

  const _MarketListItem({required this.coin, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final String currentLocale = Localizations.localeOf(context).toString();
    // TODO : Implement this properly when currency changing is a thing.
    final String currencyCode = "USD";
    final theme = Theme.of(context);
    final priceChange = coin.priceChangePercentage24h;
    final priceChangeColor = priceChange >= 0
        ? AppColors.success
        : AppColors.dangerPrimary;

    final String formattedPrice = formatCurrency(
      value: coin.currentPrice,
      currencyCode: currencyCode,
      locale: currentLocale,
    );
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddings.md,
          vertical: AppPaddings.sm,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: theme.colorScheme.surface,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: coin.image,
                errorWidget: (context, url, error) {
                  return const SizedBox.shrink();
                },
              ),
            ),
            const SizedBox(width: AppPaddings.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin.name,
                    style: theme.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    coin.symbol.toUpperCase(),
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppPaddings.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(formattedPrice, style: theme.textTheme.titleMedium),
                  Text(
                    '${priceChange.toStringAsFixed(2)}%',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: priceChangeColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
