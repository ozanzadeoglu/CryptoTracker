part of '../market_screen.dart'; // Links this file to the main screen

/// A private helper widget for the sort option bottom sheet tiles.
class _SortOptionTile extends StatelessWidget {
  final MarketSortOption option;
  final MarketSortOption currentOption;
  final VoidCallback onTap;

  const _SortOptionTile({
    required this.option,
    required this.currentOption,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = option == currentOption;
    return ListTile(
      title: Text(
        option.localized(context),
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: isSelected ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary) : null,
      onTap:  onTap,
    );
  }
}