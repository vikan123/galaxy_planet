import 'package:flutter/material.dart';
import 'package:galaxy_planet/Screen/detail.dart';
import 'package:galaxy_planet/get/gettheme.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  MyController controller = Get.put(MyController());



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://c1.wallpaperflare.com/preview/85/553/267/stars-background-blue-photoshop.jpg",),
                fit: BoxFit.cover)
          ),
        ),
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(title:const Text("Solar Planets",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          backgroundColor: Colors.white,
            actions: const [
              Padding(padding: EdgeInsets.all(20),
              child: Icon(Icons.more_vert,color: Colors.black,),)
            ],
          ),
            backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height/8,),
                const Text("About:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: size.height/40,),
                 const Text("The word planet is derived from the word “planets” which means wanderer this name is given to them as they appear to wander in the night sky from east to west while stars also move from east to west but they seem to remain fixed relative to each other and the planet relative to them seem to move forward and backward. \nA planet is a celestial body that revolves around the sun in fixed orbits and planets do not have the light of their own but reflects the light of the sun they also do not twinkle like other stars as they are too close to us and till now the earth is the only known planet to harbor life and have the favorable condition.",
                style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w400),),
                SizedBox(height: size.height/50,),
                GetX<MyController>(
                  init: MyController(),
                  builder: (controller) {
                    if (controller.planet.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }
                    else {
                      return SizedBox(
                          height: 450
                          , child: ListView.builder(
                          itemCount: controller.planet.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(_createRoute(index));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Container(
                                    height: size.height / 2.1,
                                    width: size.width / 1.1,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.circular(20),),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Image.network(
                                            controller.planet[index].img),
                                        SizedBox(height: size.height / 30,),
                                        Padding(padding: const EdgeInsets.only(
                                            left: 20),
                                            child: Text(controller
                                                .planet[index].name,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 50
                                                )))
                                      ],
                                    ),
                                  ),
                                ));
                          }));
                    }

                  })

              ],
            ),
          ),

        )
        

      ],
    );
  }
  Route _createRoute(int index){
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => DetailScreen(planets: controller.planet[index]),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}


