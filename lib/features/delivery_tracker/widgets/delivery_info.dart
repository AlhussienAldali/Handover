import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:handover/core/ui_and_statics/app_colors.dart';
import 'package:handover/core/ui_and_statics/app_strings.dart';
import 'package:handover/core/ui_and_statics/dimensions.dart';
import 'package:handover/features/delivery_tracker/provider/map_provider.dart';
import 'package:handover/features/delivery_tracker/widgets/delivery_time_line.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Provider.of<MapProvider>(context, listen: true).deliveryStage !=
                  DeliveryStage.done
              ? buildSmallMenu(context)
              : buildLongMenu(context),
          Positioned(
            top: -Dimensions.profileRadios!,
            child: CircleAvatar(
              radius: Dimensions.profileRadios,
              backgroundImage: const AssetImage("assets/profile.png"),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Container buildLongMenu(context) {
    return Container(
        decoration: const BoxDecoration(
            color: AppColors.darkYellow,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.mainScreenContainerRadios),
                topRight:
                    Radius.circular(Dimensions.mainScreenContainerRadios))),
        height: Dimensions.mainScreenBigBarHeight,
        width: Dimensions.mainScreenBarWidth,
        child: Padding(
          padding: EdgeInsets.only(top: Dimensions.profileRadios!),
          child: Column(
            children: [
              const Text(
                AppStrings.profileName,
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: Dimensions.mainPadding * 1.5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimensions.mainPadding,
                    right: Dimensions.mainPadding),
                child: Column(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize: 40,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 9.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                      onRatingUpdate: (rating) {
                        if (kDebugMode) {
                          print(rating);
                        }
                      },
                    ),
                    const SizedBox(
                      height: Dimensions.mainPadding * 1.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(AppStrings.pickedUpTime,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: Dimensions.smallPadding),
                            Text(AppStrings.deliveredTime,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                                DateFormat('hh:mm a').format(
                                    Provider.of<MapProvider>(context,
                                            listen: false)
                                        .pickUpTime!),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: Dimensions.smallPadding),
                            Text(
                                DateFormat('hh:mm a').format(
                                    Provider.of<MapProvider>(context,
                                            listen: false)
                                        .deliveredTime!),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: Dimensions.mediumPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(AppStrings.total,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    const SizedBox(height: Dimensions.smallPadding),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: Dimensions.mainPadding),
                        child: Text(AppStrings.price,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/result');
                    },
                    child: Container(
                      width: Dimensions.submitWidth,
                      height: Dimensions.submitHeight,
                      decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(Dimensions.submitRounded),
                              bottomLeft:
                                  Radius.circular(Dimensions.submitRounded))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(AppStrings.submit),
                          Icon(
                            Icons.arrow_right_alt,
                            size: Dimensions.iconSize,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Container buildSmallMenu(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.darkYellow,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.mainScreenContainerRadios),
              topRight: Radius.circular(Dimensions.mainScreenContainerRadios))),
      height: Dimensions.mainScreenBarHeight,
      width: Dimensions.mainScreenBarWidth,
      child: Padding(
        padding: EdgeInsets.only(top: Dimensions.profileRadios!),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(Dimensions.smallPadding),
              child: Text(
                AppStrings.profileName,
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
            ),
            DeliveryTimeLine(
              deliveryStage:
                  Provider.of<MapProvider>(context, listen: true).deliveryStage,
            )
          ],
        ),
      ),
    );
  }
}
