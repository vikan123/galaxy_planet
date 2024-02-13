import 'package:flutter/material.dart';
import 'package:galaxy_planet/modal/planet.dart';

class DetailScreen extends StatefulWidget {
  final Planets planets;
  const DetailScreen({super.key, required this.planets});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz9RkEBAN5Pxf11ZBFY23Xga9fYYQ3zh-qo2bXA_P-Mxv7BWu3Wkr0Q2WOLmIBgJLVp0c&usqp=CAU",
                  ),
                  fit: BoxFit.cover)),
        ),
        Scaffold(
            appBar: AppBar(
              title: Text(
                widget.planets.name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: _updateSize,
                        child: AnimatedSize(
                            curve: Curves.easeInCirc,
                            duration: const Duration(seconds: 1),
                            child: Image.network(widget.planets.img,height: _size))),
                    SizedBox(
                      height: size.height / 70,
                    ),
                    Text(
                      widget.planets.detail,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
