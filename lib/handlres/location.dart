import 'dart:math';

import 'package:vector_math/vector_math.dart';
import 'package:geolocator/geolocator.dart';


double earthRadius = 6371000; 

//Using pLat and pLng as dummy location
double mLat = 31.040949;   double mLng = 31.378469; 
double cLat = 30.033333;   double cLng = 31.233334;


//Use Geolocator to find the current location(latitude & longitude)


//Calculating the distance between two points without Geolocator plugin
getDistancewithoutGeo(){
   var dLat = radians(mLat - cLat);
   var dLng = radians(mLng -cLng);
   var a = sin(dLat/2) * sin(dLat/2) + cos(radians(cLat)) 
           * cos(radians(mLat)) * sin(dLng/2) * sin(dLng/2);
   var c = 2 * atan2(sqrt(a), sqrt(1-a));
   var d = earthRadius * c/1000;
   print(d); //d is the distance in meters
}

//Calculating the distance between two points with Geolocator plugin
getDistancewithGeo(){
   final double distance = Geolocator.distanceBetween(mLat, mLng, 
           cLat, cLng)/1000; 
   print(distance); //distance in meters
}