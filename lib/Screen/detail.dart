import 'package:flutter/material.dart';
import 'package:galaxy_planet/modal/planet.dart';
class DetailScreen extends StatelessWidget {
  final Planets planets;
  const DetailScreen({super.key, required this.planets});

  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz9RkEBAN5Pxf11ZBFY23Xga9fYYQ3zh-qo2bXA_P-Mxv7BWu3Wkr0Q2WOLmIBgJLVp0c&usqp=CAU",),
                  fit: BoxFit.cover)
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(planets.name,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          body: Padding(padding: const EdgeInsets.all(20),child: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  child: Image.network(planets.img),),
                SizedBox(height: size.height/70,),
                Text(planets.detail,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),)
                
              ],
            ),
          ),)
        )
      ],
    );
  }
}
