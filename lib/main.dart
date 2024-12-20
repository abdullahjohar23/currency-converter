import 'package:flutter/material.dart';
import 'package:currency_converter/currency_converter_material_page.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:currency_converter/currency_converter_cupertino_page.dart';

void main() {
    runApp(const MyMaterialApp());
    // runApp(const MyCupertinoApp()); // you can run this if you want to see our Cupertino Designed App
}

// main class for MaterialApp file
class MyMaterialApp extends StatelessWidget {
    const MyMaterialApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            /*
                this is the reason for the AppBar being white by default
                useMaterial1 (M1), useMaterial2 (M2), useMaterial3 (M3) these are Material Design Guidelines
                M3 is the latest version now
                you don't have to bother about the default color, cause you can control the color anyway
            */
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: false, //control the version using this (not using this will give you M3 version)
            ),
            
            home: const CurrencyConverterMaterialPage(),
        );
    }
}

// main class for CupertinoApp file
/*
class MyCupertinoApp extends StatelessWidget {
    const MyCupertinoApp({super.key});

    @override
    Widget build(BuildContext context) {
        return const CupertinoApp(
            home: CurrencyConverterCupertinoPage(),
        );
    }
}
*/

