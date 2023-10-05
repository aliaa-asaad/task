import 'package:task/data/model/drivers_model.dart';

class DataModel {
  List<Drivers>? drivers;

  DataModel({this.drivers});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['drivers'] != null) {
      drivers = <Drivers>[];
      json['drivers'].forEach((v) {
        drivers!.add(Drivers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (drivers != null) {
      data['drivers'] = drivers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
