import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import '../modal/planet.dart';

class MyController extends GetxController{
   RxBool isDark = false.obs;
    bool isReady =false;
   final planet = <Planets>[].obs;


   void toggleTheme(){
     isDark.value= !isDark.value;
   }
   @override
   void onInit() {
     super.onInit();
     loadPlanets();
   }
   Future<void> loadPlanets() async {
     try {
       String jsonData = await rootBundle.loadString('asset/planet.json');
       List<dynamic> jsonList = json.decode(jsonData);
       planet.value = jsonList.map((json) => Planets.fromJson(json)).toList();
       isReady = true;
     } catch (e) {
       print('Error loading planets: $e');
     }
   }


}








