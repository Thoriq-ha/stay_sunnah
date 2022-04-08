// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:stay_sunnah/app/data/remote/models/quote_model.dart';
import 'package:stay_sunnah/app/data/remote/providers/quote_provider.dart';

class TabHomeController extends GetxController with StateMixin<Quote> {
  @override
  void onInit() {
    super.onInit();
    getRandomQuotes();
  }

  void getRandomQuotes() {
    QuoteProvider().getQuote().then((data) => (data != null)
        ? change(data, status: RxStatus.success())
        : change(data, status: RxStatus.empty()));
  }
}
