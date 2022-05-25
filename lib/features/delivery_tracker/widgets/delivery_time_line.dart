import 'package:flutter/material.dart';
import 'package:handover/core/ui_and_statics/app_colors.dart';
import 'package:handover/core/ui_and_statics/app_strings.dart';
import 'package:handover/core/ui_and_statics/dimensions.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DeliveryTimeLine extends StatelessWidget {
  final DeliveryStage deliveryStage;

  const DeliveryTimeLine({required this.deliveryStage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    switch (deliveryStage) {
      case DeliveryStage.onTheWay:
        {
          widgets.add(
              buildTimelineTile(AppStrings.onTheWay, true, false, true, false));
          widgets.add(buildTimelineTile(
              AppStrings.pickedUpDelivery, false, false, false, false));
          widgets.add(buildTimelineTile(
              AppStrings.nearDeliveryDestination, false, false, false, false));
          widgets.add(buildTimelineTile(
              AppStrings.deliveredPackage, false, false, false, true));
          break;
        }
      case DeliveryStage.pickedUpDelivery:
        {
          widgets.add(
              buildTimelineTile(AppStrings.onTheWay, true, true, true, false));
          widgets.add(buildTimelineTile(
              AppStrings.pickedUpDelivery, true, false, false, false));
          widgets.add(buildTimelineTile(
              AppStrings.nearDeliveryDestination, false, false, false, false));
          widgets.add(buildTimelineTile(
              AppStrings.deliveredPackage, false, false, false, true));
          break;
        }
      case DeliveryStage.nearDeliveryDestination:
        {
          widgets.add(
              buildTimelineTile(AppStrings.onTheWay, true, true, true, false));
          widgets.add(buildTimelineTile(
              AppStrings.pickedUpDelivery, true, true, false, false));
          widgets.add(buildTimelineTile(
              AppStrings.nearDeliveryDestination, true, false, false, false));
          widgets.add(buildTimelineTile(
              AppStrings.deliveredPackage, false, false, false, true));
          break;
        }
      case DeliveryStage.deliveredPackage:
        {
          widgets.add(
              buildTimelineTile(AppStrings.onTheWay, true, true, true, false));
          widgets.add(buildTimelineTile(
              AppStrings.pickedUpDelivery, true, true, false, false));
          widgets.add(buildTimelineTile(
              AppStrings.nearDeliveryDestination, true, true, false, false));
          widgets.add(buildTimelineTile(
              AppStrings.deliveredPackage, true, false, false, true));
          break;
        }
      case DeliveryStage.done:
        break;
    }
    return Column(
      children: widgets,
    );
  }

  TimelineTile buildTimelineTile(
      String text, bool done, bool afterLine, bool isFirst, bool isLast) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
          color: done ? AppColors.black : AppColors.white, thickness: 2.5),
      afterLineStyle: LineStyle(
          color: afterLine ? AppColors.black : AppColors.white, thickness: 2.5),
      indicatorStyle: IndicatorStyle(
          color: done ? AppColors.black : AppColors.white,
          height: 8,
          width: 8,
          padding: const EdgeInsets.only(left: 20, right: 20)),
      endChild: Container(
        padding: EdgeInsets.only(
            top: done
                ? Dimensions.timeLinePadding
                : Dimensions.timeLinePadding + 10,
            bottom: done
                ? Dimensions.timeLinePadding
                : Dimensions.timeLinePadding + 10),
        child: Text(
          text,
          style: TextStyle(color: done ? AppColors.black : AppColors.white),
        ),
      ),
    );
  }
}

enum DeliveryStage {
  onTheWay,
  pickedUpDelivery,
  nearDeliveryDestination,
  deliveredPackage,
  done
}
