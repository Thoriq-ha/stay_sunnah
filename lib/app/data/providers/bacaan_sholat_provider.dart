import 'package:get/get.dart';

import '../models/bacaan_sholat_model.dart';

class BacaanSholatProvider extends GetConnect {
  Future<List<BacaanSholat>?> getBacaanSholat() async {
    final response = await get(
        'https://staysun-af8d8-default-rtdb.firebaseio.com/bacaan-sholat.json');

    var listBacaanDoa = Data.fromJson(response.body);
    return listBacaanDoa.bacaanSholat;
  }
}
