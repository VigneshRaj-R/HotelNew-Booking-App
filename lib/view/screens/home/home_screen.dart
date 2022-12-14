import 'package:flutter/material.dart';
import 'package:hotelnew/utils/colors.dart';
import 'package:hotelnew/utils/sizes.dart';
import 'package:hotelnew/view/screens/home/widgets/category_card.dart';
import 'package:hotelnew/view/screens/home/widgets/search.dart';
import 'package:hotelnew/view/widgets/double_color_title.dart';
import 'package:hotelnew/view/widgets/loading_indicator.dart';
import 'package:hotelnew/view/widgets/main_card.dart';
import 'package:hotelnew/view/widgets/shimmer_skeleton.dart';
import 'package:hotelnew/view_model/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeProvider = context.read<HomeViewModel>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: size.height / 2,
              width: size.width,
              child: const ColoredBox(
                color: KColors.kThemeGreen,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KSizedBox.kHeigh_5,
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: DoubleColorTitle(
                      text1: 'Hotel',
                      text2: 'New',
                      firstColor: KColors.kWhiteColor,
                      gap: 2,
                      textSize: 27,
                    ),
                  ),
                  KSizedBox.kHeigh_15,
                  const SearchField(),
                  KSizedBox.kHeigh_15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCard(
                        img: 'assets/images/hotel_icon.png',
                        title: 'Hotel',
                        onTap: () {
                          homeProvider.onHotelButton();
                        },
                      ),
                      CategoryCard(
                        img: 'assets/images/home_stay_icon.png',
                        title: 'Home stay',
                        onTap: () {
                          homeProvider.onHomeStayButton();
                        },
                      ),
                      CategoryCard(
                        img: 'assets/images/resort_icon.png',
                        title: 'Resort',
                        onTap: () {
                          homeProvider.onResortButton();
                        },
                      ),
                    ],
                  ),
                  KSizedBox.kHeigh_15,
                  Selector<HomeViewModel, bool>(
                    selector: (_, obj) => obj.isLoading,
                    builder: ((__, isLoading, _) {
                      return homeProvider.isLoading
                          ? Column(
                              children: [
                                ShimmerSkelton(
                                  height: size.height / 3.7,
                                  width: double.infinity,
                                ),
                                KSizedBox.kHeigh_20,
                                const LoadingIndicator(
                                  color: KColors.kThemeGreen,
                                )
                              ],
                            )
                          : homeProvider.allRooms.isEmpty
                              ? Column(
                                  children: [
                                    ShimmerSkelton(
                                      height: size.height / 3.7,
                                      width: double.infinity,
                                    ),
                                    KSizedBox.kHeigh_20,
                                    ElevatedButton.icon(
                                      label: const Text('Tap to refresh'),
                                      icon: const Icon(Icons.refresh),
                                      onPressed: () {
                                        homeProvider.getAllRoom();
                                      },
                                    ),
                                  ],
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: homeProvider.allRooms.length,
                                  itemBuilder: ((_, index) {
                                    return MainCard(
                                      hotel: homeProvider.allRooms[index],
                                    );
                                  }),
                                  separatorBuilder: ((_, __) {
                                    return KSizedBox.kHeigh_10;
                                  }),
                                );
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
