import 'dart:async';

import 'package:flutter/material.dart';
import 'package:galaxy_planet/Screen/home_screen.dart';
import 'package:galaxy_planet/get/gettheme.dart';
import 'package:get/get.dart';

void main() {
 runApp (const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(MyController());
      }),
      routes: {
        '/home': (context) => const HomeScreen(), // Replace HomeScreen with your main app screen
      },
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context,'/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(body:Stack(
      children: [
        SizedBox(
          height: size.height,
          child: Image.network("https://w0.peakpx.com/wallpaper/646/886/HD-wallpaper-solar-system-earth-galaxy-planet-planets-universe.jpg",height: size.height,fit:BoxFit.cover,),

        ),
        const Center(
         child: Text("Solar\n Planets",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)
        )
      ],
    ));
  }
}


