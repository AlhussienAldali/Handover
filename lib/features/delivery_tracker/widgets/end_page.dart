import 'package:flutter/material.dart';
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
            "you have to accept me in your team hehe, because I look like the cat in the picture after I finished the test",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
