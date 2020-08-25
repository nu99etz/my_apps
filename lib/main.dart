import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_apps/providers/pegawai_providers.dart';
import './pages/pegawai.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PegawaiProviders(),
        )
      ],
      child: MaterialApp(
        home: Pegawai(),
      ),
    );
  }
}