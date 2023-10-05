import 'package:task/data/model/work_cities_model.dart';

class Drivers {
  String? name;
  String? phone;
  String? personalPhoto;
  List<WorkCitys>? workCitys;

  Drivers({this.name, this.phone, this.personalPhoto, this.workCitys});

  Drivers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    personalPhoto = json['personal_photo'];
    if (json['work_citys'] != null) {
      workCitys = <WorkCitys>[];
      json['work_citys'].forEach((v) {
        workCitys!.add(WorkCitys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['personal_photo'] = personalPhoto;
    if (workCitys != null) {
      data['work_citys'] = workCitys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
