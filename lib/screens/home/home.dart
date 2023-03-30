import 'package:flutter/material.dart';
import '../../widgets/notako_appbar.dart';
import '../../widgets/notako_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: notakoAppBar(),
      drawer: notakoDrawer(),
    );
  }
}