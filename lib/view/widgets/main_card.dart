import 'package:flutter/material.dart';
import 'package:hotelnew/model/home/all_rooms.dart';
import 'package:hotelnew/view/widgets/shimmer_skeleton.dart';
import 'package:hotelnew/view/widgets/title_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
    required this.hotel,
  }) : super(key: key);
  final AllRoomsModel hotel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
       // context.read<HotelViewModel>().onInit();
        // Navigations.push(
        //   HotelScreen(hotel: hotel),
        // );
      },
      child: Container(
        height: size.height / 3.7,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                height: size.height / 3.7,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: hotel.images?.first[0].url ?? KStrings.dummyNetImage,
                placeholder: (context, url) => ShimmerSkelton(
                  height: size.height / 3.7,
                  width: double.infinity,
                ),
                errorWidget: (context, url, error) =>
                    Image.asset(KStrings.noInterNetImage),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(123, 0, 0, 0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width / 1.8,
                              child: TitleWidget(
                                hotel.property?.propertyName ??
                                    'Hotel name is not available',
                                fontSize: 18,
                                color: KColors.kWhiteColor,
                              ),
                            ),
                            TitleWidget(
                              hotel.property?.city ?? '',
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(123, 0, 0, 0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: TitleWidget(
                          '₹ ${hotel.price.toString()}',
                          fontSize: 18,
                          color: KColors.kWhiteColor,
                        ),
                      ),
                    ],
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
