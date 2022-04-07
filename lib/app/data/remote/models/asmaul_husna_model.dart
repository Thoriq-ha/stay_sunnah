class Data {
  List<AsmaulHusna>? asmaulHusna;

  Data({this.asmaulHusna});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['asmaul-husna'] != null) {
      asmaulHusna = <AsmaulHusna>[];
      json['asmaul-husna'].forEach((v) {
        asmaulHusna?.add(AsmaulHusna.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (asmaulHusna != null) {
      data['asmaul-husna'] = asmaulHusna?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AsmaulHusna {
  String? index;
  String? latin;
  String? arabic;
  String? translationId;
  String? translationEn;

  AsmaulHusna(
      {this.index,
      this.latin,
      this.arabic,
      this.translationId,
      this.translationEn});

  AsmaulHusna.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    latin = json['latin'];
    arabic = json['arabic'];
    translationId = json['translation_id'];
    translationEn = json['translation_en'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['index'] = index;
    data['latin'] = latin;
    data['arabic'] = arabic;
    data['translation_id'] = translationId;
    data['translation_en'] = translationEn;
    return data;
  }
}
