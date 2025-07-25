part of '../market_screen.dart';

/// The content for the sort options bottom sheet.
class _SortOptionsSheet extends StatelessWidget {
  final void Function(MarketSortOption option) changeSortFunction;
  final MarketSortOption currentSortOption;
  const _SortOptionsSheet({
    required this.changeSortFunction,
    required this.currentSortOption,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: MarketSortOption.values.map((option) {
          return _SortOptionTile(
            option: option,
            currentOption: currentSortOption,
            onTap: () {
              changeSortFunction(option);
              Navigator.pop(context);
            },
          );
        }).toList(),
      ),
    );
  }
}