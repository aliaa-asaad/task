class WorkCitys {
  String? city;
  int? price;

  WorkCitys({this.city, this.price});

  WorkCitys.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['price'] = price;
    return data;
  }
}
