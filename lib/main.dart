import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tech_no_fear/blocs/bloc/page_bloc.dart';
import 'package:tech_no_fear/presentaion/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

final getIt = GetIt.instance;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getIt.registerLazySingleton<PageBloc>(
      () => PageBloc(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
