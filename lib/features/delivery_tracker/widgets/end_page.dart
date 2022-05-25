import 'package:flutter/material.dart';
import 'package:handover/core/ui_and_statics/app_strings.dart';
import 'package:handover/core/ui_and_statics/dimensions.dart';

class EndPage extends StatelessWidget {
  const EndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: Dimensions.profileRadios,
            backgroundImage: const AssetImage("assets/sad_cat.png"),
            backgroundColor: Colors.transparent,
          ),
          const Text(
            AppStrings.endPageText,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
