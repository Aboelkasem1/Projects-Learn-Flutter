import 'package:a_commerce_app/models/home_models/banners/banner_list_model.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({super.key});
  final bannerList = BannerListModel().bannerList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: SizedBox(
        height: 144,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: bannerList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  bannerList[index].img,
                  width: 304,
                  height: 144,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
