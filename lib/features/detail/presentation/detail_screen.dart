import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/ext/int_ext.dart';
import '../../../component/ext/color_ext.dart';
import '../../../component/config/app_style.dart';
import '../../../component/ext/string_ext.dart';
import 'detail_controller.dart';
import 'detail_tab_screen.dart';

class DetailScreen extends GetView<DetailController> {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (controller.detailResponse?.types?[0].type?.name ?? '')
          .getPokemonTypeColor(),
      appBar: AppBar(
        backgroundColor: (controller.detailResponse?.types?[0].type?.name ?? '')
            .getPokemonTypeColor(),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          _headerDetail(),
          SizedBox(
            height: 200,
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      DetailTabScreen(),
                      GetBuilder<DetailController>(builder: (ctrl) {
                        return IndexedStack(
                          index: ctrl.selectedScreen,
                          // children: ctrl.screenList,
                          children: ctrl.screenList
                              .map((e) => Align(
                                    alignment: Alignment.topLeft,
                                    child: e,
                                  ))
                              .toList(),
                        );
                      }),
                    ],
                  ),
                ),
                Positioned(
                  top: -250,
                  left: 0,
                  right: 0,
                  child: _imageDetail(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _headerDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (controller.detailResponse?.name ?? '-')
                        .capitalizeFirstLetter(),
                    style:
                        AppStyle.bold(size: 30, textColor: AppStyle.whiteColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      children: (controller.detailResponse?.types ?? [])
                          .map<Widget>((el) => Container(
                              decoration: BoxDecoration(
                                color: ((controller.detailResponse?.types?[0]
                                                .type?.name ??
                                            '')
                                        .getPokemonTypeColor())
                                    .lighten(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                el.type?.name ?? "",
                                style: AppStyle.bold(
                                    size: 12, textColor: AppStyle.whiteColor),
                              )))
                          .toList()
                          .expand(
                              (widget) => [widget, const SizedBox(width: 8)])
                          .toList())
                ],
              ),
              Text(
                "#${(controller.detailResponse?.id ?? 0).formatNumber()}",
                style: AppStyle.bold(size: 20, textColor: AppStyle.whiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageDetail() {
    final imageUrl = controller
            .detailResponse?.sprites?.other?.home?.frontDefault ??
        controller
            .detailResponse?.sprites?.other?.officialArtwork?.frontDefault ??
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${controller.detailResponse?.id ?? 1}.png';

    return Image.network(
      imageUrl,
      width: 300,
      height: 300,
      fit: BoxFit.contain,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return SizedBox(
            width: 100,
            height: 100,
            child: Center(
                child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            )),
          );
        }
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Icon(
          Icons.error,
          size: 50,
          color: Colors.red,
        );
      },
    );
  }
}
