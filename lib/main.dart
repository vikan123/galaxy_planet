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
          () => Navigator.of(context).push(_createRoute()),
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
  Route _createRoute(){
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInCirc;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}


