import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task/data/model/drivers_model.dart';
import 'package:task/data/model/work_cities_model.dart';
import 'package:task/data/service/get_data.dart';

class DataController extends ChangeNotifier {
  GetData getData = GetData();
  List<Drivers> _dataModel = [];
  List<Drivers> get dataModel => _dataModel;
  final List<WorkCitys> _workCitys = [];
  List<WorkCitys> get workCitys => _workCitys;
  String driverValue = 'Select';
  String cityValue = 'Select';
  void data() async {
    _dataModel = await getData.readJson();
    log('message: $_dataModel');
    log('dataModel :${_dataModel[0].name}');
    notifyListeners();
  }

  void updateDriver(String value) {
    driverValue = value;
    log('driver value: $driverValue');
    notifyListeners();
  }

  void updateCity(String value) {
    cityValue = value;
    notifyListeners();
  }

  void workCity() async {
    for (var i in _dataModel) {
      log('name=${i.name!}');
      log('driver=$driverValue');
      if (i.name == driverValue) {

       for(var j in i.workCitys!){
         _workCitys.add(j);
       }
      }
    }
    log('city: $_workCitys');
    //log('dataModel :${_workCitys[0].city}');
  }
}
