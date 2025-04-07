import 'package:cureo_test/data/Bloc/bloc_provider.dart';
import 'package:cureo_test/presentation/presentation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    
   MultiBlocProvider (
    providers: [
      BlocProvider(create: (_) => CountryBlock()),
      
    ],
    child: const MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cureo Test',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PresentationScreen());
  }
}

