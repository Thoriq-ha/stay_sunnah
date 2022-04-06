class Data {
  List<Doa>? doa;

  Data({this.doa});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      doa = <Doa>[];
      json['data'].forEach((v) {
        doa?.add(Doa.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (doa != null) {
      data['doa'] = doa?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doa {
  String? title;
  String? arabic;
  String? latin;
  String? translation;

  Doa({this.title, this.arabic, this.latin, this.translation});

  Doa.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    arabic = json['arabic'];
    latin = json['latin'];
    translation = json['translation'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['arabic'] = arabic;
    data['latin'] = latin;
    data['translation'] = translation;
    return data;
  }
}
