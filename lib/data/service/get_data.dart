import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:task/data/model/data_model.dart';
import 'package:task/data/model/drivers_model.dart';

class GetData{
  Future<List<Drivers>> readJson() async {
final String response = await rootBundle.loadString('assets/data.json');
final data = await json.decode(response);
DataModel dataModel = DataModel.fromJson(data);
List<Drivers> drivers = dataModel.drivers!;
return drivers;
// ... 
}
}