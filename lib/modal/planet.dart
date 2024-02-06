 class Planets {
   final String name;
   final String img;
   final String detail;



   Planets( {required this.name, required this.img, required this.detail,});
   factory Planets.fromJson(Map<String, dynamic> json) {
     return Planets(
       name: json['name'],
       img: json['img'],
       detail: json['detail'],

     );
   }
}



