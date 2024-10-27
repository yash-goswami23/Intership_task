import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/screens/home_screen.dart';
import 'package:my_portfolio/presentation/state/investment_provider.dart';
import 'package:my_portfolio/presentation/widgets/theme/my_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InvestmentProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme().darkTheme,
        themeMode: ThemeMode.dark,
        home: const HomeScreen(),
      ),
    );
  }
}
