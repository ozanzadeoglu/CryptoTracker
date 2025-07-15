import 'package:crypto_tracker/config/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  runApp(const CryptoTrackerState());
}

class CryptoTrackerState extends StatelessWidget {
  const CryptoTrackerState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Center(child: Text('API Key Value: ${ApiKeys.coingeckoApiKey}')),
      ),
    );
  }
}
