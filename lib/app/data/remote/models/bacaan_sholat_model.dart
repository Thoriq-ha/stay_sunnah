class Data {
  List<BacaanSholat>? bacaanSholat;

  Data({this.bacaanSholat});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      bacaanSholat = <BacaanSholat>[];
      json['data'].forEach((v) {
        bacaanSholat?.add(BacaanSholat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (bacaanSholat != null) {
      data['data'] = bacaanSholat?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BacaanSholat {
  int? id;
  String? name;
  String? arabic;
  String? latin;
  String? terjemahan;

  BacaanSholat({this.id, this.name, this.arabic, this.latin, this.terjemahan});

  BacaanSholat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arabic = json['arabic'];
    latin = json['latin'];
    terjemahan = json['terjemahan'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['arabic'] = arabic;
    data['latin'] = latin;
    data['terjemahan'] = terjemahan;
    return data;
  }
}
