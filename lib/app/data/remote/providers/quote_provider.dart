import 'package:get/get.dart';

import '../models/quote_model.dart';

class QuoteProvider extends GetConnect {
  Future<Quote?> getQuote() async {
    final response = await get(
        'https://anker-api.herokuapp.com/api/randomquote/muslim?apikey=freeapi');
    var quote = Quote.fromJson(response.body['result']);
    return quote;
  }
}
