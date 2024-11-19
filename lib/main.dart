import 'package:flutter/material.dart';
import 'package:flutter_restapi/pages/home_page.dart';
import 'package:flutter_restapi/providers/mahasiswa_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MahasiswaProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Mahasiswa',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
