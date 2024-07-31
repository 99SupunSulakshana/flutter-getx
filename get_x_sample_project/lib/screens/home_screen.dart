import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_sample_project/controllers/coin_controller.dart';
import 'package:get_x_sample_project/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  final CoinController controller = Get.put(CoinController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF494F55),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 60),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Crypto Market",
                  style: textStyle(24, Colors.white, FontWeight.bold)),
              Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.coinList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[700],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey[700]!,
                                                  offset: const Offset(4, 4),
                                                  blurRadius: 5)
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Image.network(
                                              '${controller.coinList[index].image}'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.coinList[index].name}",
                                          style: textStyle(18, Colors.white,
                                              FontWeight.w500),
                                        ),
                                        Text(
                                          "${controller.coinList[index].priceChangePercentage24H?.round()}%",
                                          style: textStyle(
                                              18, Colors.grey, FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "\$ ${controller.coinList[index].currentPrice?.round() ?? "N/A"}",
                                      style: textStyle(
                                          18, Colors.white, FontWeight.w500),
                                    ),
                                    Text(
                                      "${controller.coinList[index].symbol?.toUpperCase()}",
                                      style: textStyle(
                                          18, Colors.grey, FontWeight.w500),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
