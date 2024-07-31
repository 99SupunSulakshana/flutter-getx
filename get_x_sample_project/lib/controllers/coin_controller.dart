import 'package:get/get.dart';
import 'package:get_x_sample_project/models/coins.dart';
import 'package:http/http.dart' as http;

class CoinController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Coins> coinList = <Coins>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCoins();
  }

  fetchCoins() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
      List<Coins> coins = coinsFromJson(response.body);
      coinList.value = coins;
    } finally {
      isLoading(false);
    }
  }
}
