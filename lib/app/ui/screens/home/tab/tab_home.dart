import 'package:flutter/material.dart';

class TabHome extends StatelessWidget {
  const TabHome({super.key});

  // final List<ModelBanner> bannerList = DataFile.getAllBannerList();


  @override
  Widget build(BuildContext context) {
    return const Column(
      children:[
        Center(
          child : Text("Tab Home",
          style: TextStyle(
            color: Colors.white,
          ),),
        )
        ],
    );
  }
}