import 'package:favouriteapp/dark_theme.dart';
import 'package:favouriteapp/providers/favourite_provider.dart';
import 'package:favouriteapp/providers/theme_chnager_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourite/favourite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final themeChanger = Provider.of<ThemeChnagerProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_)=>FavouriteProvider()),
        ChangeNotifierProvider(create: (_)=>ThemeChnagerProvider()),//name of provider we write here
    ],
    child: Builder(builder: (BuildContext context){
      final themeChanger=Provider.of<ThemeChnagerProvider>(context);
      return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode:themeChanger.themeMode,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.purple,

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: DarkTheme(),
      );
    },)
    );



  }
}

