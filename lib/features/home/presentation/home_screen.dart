import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../component/ext/color_ext.dart';
import '../../../component/ext/int_ext.dart';
import '../../../component/ext/string_ext.dart';
import '../../../component/widget/listview_utils.dart';
import '../../../component/config/app_route.dart';
import '../../../component/config/app_style.dart';
import '../model/pokemon_detail_response.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  final controller = GetInstance().find<HomeController>();

  @override
  void initState() {
    super.initState();

    controller.getItems.reset();
    scrollController.onLoadMore(() {
      controller.getItems.loadMore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.whiteColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Pokedex",
                style: AppStyle.bold(textColor: AppStyle.textColor, size: 28),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _listPokemon(),
          ],
        ),
      ),
    );
  }

  Widget _listPokemon() {
    return Observer(builder: (context) {
      final isLoading = controller.getItems.isLoading.value;
      final isLoadMore = controller.getItems.loadMoreLoading.value;
      final items = controller.getItems.items;

      if (!isLoading && items.isEmpty) {
        return Expanded(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              "No Data Available",
              style: AppStyle.bold(size: 18, textColor: AppStyle.grey3),
            ),
          ],
        )));
      }

      return Expanded(
        child: Skeletonizer(
          enabled: isLoading,
          child: RefreshIndicator(
            onRefresh: () {
              controller.getItems.reset();
              return Future.value();
            },
            child: AlignedGridView.count(
              controller: scrollController,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: EdgeInsets.symmetric(horizontal: 20),
              addRepaintBoundaries: false,
              itemCount: isLoading ? 10 : (items.length) + 1,
              itemBuilder: (context, index) {
                final item = items.elementAtOrNull(index);
                if (index == items.length && items.isNotEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                          bottom:
                              50 + MediaQuery.viewPaddingOf(context).bottom),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: isLoadMore == true
                            ? CircularProgressIndicator(color: AppStyle.blue)
                            : Container(),
                      ),
                    ),
                  );
                }

                final imageUrl = item?.sprites?.other?.home?.frontDefault ??
                    item?.sprites?.other?.officialArtwork?.frontDefault ??
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${item?.id ?? 1}.png';
                final itemType = item?.types;

                return _cardPokemon(
                    background: (item?.types?[0].type?.name ?? '')
                        .getPokemonTypeColor(),
                    isLoading: isLoading,
                    idPokemon: "#${(item?.id ?? 0).formatNumber()}",
                    textColorId: ((item?.types?[0].type?.name ?? '')
                            .getPokemonTypeColor())
                        .darken(0.2),
                    name: (item?.name ?? 'Bulbasaur').capitalizeFirstLetter(),
                    colorType: ((item?.types?[0].type?.name ?? '')
                            .getPokemonTypeColor())
                        .lighten(0.1),
                    itemType: itemType,
                    imageUrl: imageUrl,
                    items: item);
              },
            ),
          ),
        ),
      );
    });
  }

  Widget _cardPokemon({
    bool isLoading = true,
    Color? background,
    String idPokemon = '0000',
    Color? textColorId,
    String name = "",
    Color? colorType,
    List<Types>? itemType,
    PokemonDetailResponse? items,
    String imageUrl = '',
  }) {
    return GestureDetector(
      onTap: isLoading
          ? null
          : () {
              Get.toNamed(AppRoute.detail, arguments: items);
            },
      child: Container(
        height: 140,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isLoading ? Colors.transparent : background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    idPokemon,
                    style: AppStyle.bold(
                      size: 18,
                      textColor: textColorId,
                    ),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          (name).capitalizeFirstLetter(),
                          style: AppStyle.bold(
                              size: 16, textColor: AppStyle.whiteColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                            children: (itemType ?? [])
                                .map<Widget>((el) => Container(
                                    decoration: BoxDecoration(
                                      color: colorType,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: Text(
                                      el.type?.name ?? "",
                                      style: AppStyle.bold(
                                          size: 12,
                                          textColor: AppStyle.whiteColor),
                                    )))
                                .toList()
                                .expand((widget) =>
                                    [widget, const SizedBox(height: 8)])
                                .toList())
                      ],
                    ),
                  ),
                  Positioned(
                    top: -10,
                    right: 0,
                    child: Skeleton.ignore(
                      child: Image.network(
                        imageUrl,
                        width: 100,
                        height: 100,
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
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Icon(
                            Icons.error,
                            size: 50,
                            color: Colors.red,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
