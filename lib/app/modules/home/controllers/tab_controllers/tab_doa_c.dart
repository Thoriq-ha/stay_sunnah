import 'package:get/get.dart';

import '../../../../data/remote/models/doa_model.dart';
import '../../../../data/remote/providers/doa_provider.dart';

class TabDoaController extends GetxController with StateMixin<List<Doa>> {
  @override
  void onInit() {
    super.onInit();
    getBacaanList();
  }

  void getBacaanList() {
    DoaProvider().getDoa().then((data) => (data!.isNotEmpty)
        ? change(data, status: RxStatus.success())
        : change(data, status: RxStatus.empty()));
  }
}
