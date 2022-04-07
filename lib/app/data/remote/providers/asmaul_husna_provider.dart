import 'package:get/get.dart';

import '../models/asmaul_husna_model.dart';

class AsmaulHusnaProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return AsmaulHusna.fromJson(map);
      if (map is List) {
        return map.map((item) => AsmaulHusna.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<AsmaulHusna?> getAsmaulHusna(int id) async {
    final response = await get('asmaulhusna/$id');
    return response.body;
  }

  Future<Response<AsmaulHusna>> postAsmaulHusna(
          AsmaulHusna asmaulhusna) async =>
      await post('asmaulhusna', asmaulhusna);
  Future<Response> deleteAsmaulHusna(int id) async =>
      await delete('asmaulhusna/$id');
}
