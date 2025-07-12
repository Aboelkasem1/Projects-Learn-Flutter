class BannerModel {
  final String img;
  BannerModel({required this.img});
}

class BannerListModel {
  List<BannerModel> bannerList = [
    BannerModel(img: 'assets/images/home_image/banners/banner1.png'),
    BannerModel(img: 'assets/images/home_image/banners/banner2.png'),
    BannerModel(img: 'assets/images/home_image/banners/banner3.png'),
  ];
  addBanner(BannerModel banner) {
    bannerList.add(banner);
  }
}
