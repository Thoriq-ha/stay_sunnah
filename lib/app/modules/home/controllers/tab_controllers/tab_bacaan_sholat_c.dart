import 'package:get/get.dart';

import '../../../../data/remote/models/bacaan_sholat_model.dart';
import '../../../../data/remote/providers/bacaan_sholat_provider.dart';

class TabBacaanSholatController extends GetxController
    with StateMixin<List<BacaanSholat>> {
  @override
  void onInit() {
    super.onInit();
    getDoaList();
  }

  void getDoaList() {
    BacaanSholatProvider().getBacaanSholat().then((data) => (data!.isNotEmpty)
        ? change(data, status: RxStatus.success())
        : change(data, status: RxStatus.empty()));
  }
}
