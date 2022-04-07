import 'package:get/get.dart';

import '../models/doa_model.dart';

class DoaProvider extends GetConnect {
  Future<List<Doa>?> getDoa() async {
    final response =
        await get('https://staysun-af8d8-default-rtdb.firebaseio.com/doa.json');
    var listDoa = Data.fromJson(response.body);
    return listDoa.doa;
  }
}
