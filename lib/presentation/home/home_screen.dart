import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager/colors_manager.dart';
import 'package:movies_app/presentation/home/tabs/home_tab/view/home_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManager.darkGrey,
      body: HomeTab(),
    );
  }
}
