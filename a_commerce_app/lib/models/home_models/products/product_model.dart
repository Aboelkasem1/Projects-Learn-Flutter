import 'package:flutter/widgets.dart';

class ProductModel {
  final String img;
  final String name;
  final String price;
  final String description;
  final List<Color> colors;
  final int peopleBuy;
  final ProductOwner owner;

  ProductModel({
    required this.img,
    required this.name,
    required this.price,
    required this.description,
    required this.colors,
    required this.peopleBuy,
    required this.owner,
  });
}

class ProductListModel {
  List<ProductModel> productList = [
    ProductModel(
      img: 'assets/images/home_image/products/product1.png',
      name: 'Monitor LG 22” 4K 120Hz',
      price: '199.99',
      description: '''
LG 22-inch monitor delivers 4K resolution and smooth 120Hz refresh rate, ideal for gaming and productivity.

Key Features:
- 4K Ultra HD display
- 120Hz refresh rate for smooth motion
- Wide color gamut and IPS panel
- HDMI and DisplayPort input

Technical Specifications:
- Screen size: 21.5 inches
- Resolution: 3840 x 2160
- Refresh Rate: 120Hz
- Panel Type: IPS
- Brightness: 300 nits

In the Box:
- LG 4K Monitor
- Power Adapter
- HDMI Cable
- User Manual
''',
      colors: [Color(0xff1E88E5), Color(0xff43A047), Color(0xffFDD835)],
      peopleBuy: 123,
      owner: ProductOwner(img: 'assets/images/home_image/products/product1.png', name: 'Owner 1'),
    ),

    ProductModel(
      img: 'assets/images/home_image/products/product2.png',
      name: 'Aesthetic White Mug',
      price: '19.99',
      description: '''
Simple and elegant white ceramic mug, perfect for hot drinks at home or the office.

Key Features:
- High-quality ceramic
- Glossy white finish
- 350ml capacity
- Microwave and dishwasher safe

Technical Specifications:
- Material: Ceramic
- Capacity: 350ml
- Dimensions: 9cm height x 8cm diameter

In the Box:
- White Mug
- Product tag
''',
      colors: [Color(0xffA1887F), Color(0xffD7CCC8), Color(0xffFFFFFF)],
      peopleBuy: 89,
      owner: ProductOwner(img: 'assets/images/home_image/products/product1.png', name: 'Owner 1'),
    ),

    ProductModel(
      img: 'assets/images/home_image/products/product3.png',
      name: 'AirPods Pro',
      price: '499.99',
      description: '''
AirPods Pro offer immersive sound with Active Noise Cancellation and adaptive fit.

Key Features:
- Active Noise Cancellation
- Adaptive Transparency mode
- Spatial Audio with dynamic head tracking
- Adaptive EQ

Technical Specifications:
- Apple-designed driver
- Multiple sensors (optical, motion, skin-detect)
- H2 chip
- Bluetooth 5.3

Battery Life:
- Up to 6 hours listening (ANC on)
- 30 hours with charging case

In the Box:
- AirPods Pro
- Charging Case
- USB-C Cable
- Silicone ear tips
''',
      colors: [Color(0xffFFFFFF), Color(0xffC8E6C9), Color(0xffB3E5FC)],
      peopleBuy: 230,
      owner: ProductOwner(img: 'assets/images/home_image/owners/owner1.jpg', name: 'Apple Store'),
    ),

    ProductModel(
      img: 'assets/images/home_image/products/product4.png',
      name: 'PlayStation 4 - 128GB SSD',
      price: '1999.99',
      description: '''
PlayStation 4 with upgraded 128GB SSD delivers faster load times and enhanced gaming performance.

Key Features:
- 128GB SSD storage
- DualShock 4 controller support
- Access to PS Store and PS Plus
- Full HD graphics

Technical Specifications:
- CPU: AMD Jaguar 8-core
- GPU: AMD Radeon-based, 1.84 TFLOPS
- RAM: 8GB GDDR5
- Storage: 128GB SSD

In the Box:
- PS4 Console
- Wireless Controller
- HDMI Cable
- Power Cable
- USB Cable
''',
      colors: [Color(0xff212121), Color(0xff616161), Color(0xff757575)],
      peopleBuy: 412,
      owner: ProductOwner(img: 'assets/images/home_image/products/product1.png', name: 'Owner 1'),
    ),

    ProductModel(
      img: 'assets/images/home_image/products/product5.png',
      name: 'Classic Black T-Shirt',
      price: '19.99',
      description: '''
Premium black cotton T-shirt designed for everyday comfort and timeless style.

Key Features:
- 100% soft cotton
- Regular fit
- Machine washable
- Ribbed neckline

Technical Specifications:
- Material: 100% Cotton
- Fit: Regular
- Sizes: S, M, L, XL

In the Box:
- Black T-shirt
- Brand Tag
''',
      colors: [Color(0xff000000), Color(0xff424242), Color(0xff616161)],
      peopleBuy: 330,
      owner: ProductOwner(img: 'assets/images/home_image/products/product1.png', name: 'Owner 1'),
    ),

    ProductModel(
      img: 'assets/images/home_image/products/product6.png',
      name: 'MacBook Pro 8GB/128GB – Touch Bar',
      price: '1299.99',
      description: '''
MacBook Pro with Touch Bar combines power and portability for professionals and creatives.

Key Features:
- 13.3" Retina Display
- Touch Bar and Touch ID
- 8GB RAM and 128GB SSD
- Backlit Magic Keyboard

Technical Specifications:
- CPU: Apple M1 / Intel i5
- RAM: 8GB unified memory
- Storage: 128GB SSD
- Ports: 2x USB-C, 3.5mm jack

Battery Life:
- Up to 17 hours web usage
- Fast charging via USB-C

In the Box:
- MacBook Pro
- USB-C Power Adapter
- USB-C Cable
''',
      colors: [Color(0xffB0BEC5), Color(0xff90A4AE), Color(0xffCFD8DC)],
      peopleBuy: 102,
      owner: ProductOwner(img: 'assets/images/home_image/products/product1.png', name: 'Owner 1'),
    ),

    ProductModel(
      img: 'assets/images/home_image/products/product7.png',
      name: 'Fujifilm XA5 Camera',
      price: '199.99',
      description: '''
Fujifilm XA5 is a compact mirrorless camera built for beginners and casual photography.

Key Features:
- 24.2MP APS-C sensor
- 4K video support
- Flip-up LCD for selfies
- Built-in Wi-Fi and Bluetooth

Technical Specifications:
- Sensor: APS-C CMOS
- ISO Range: 200–12800
- Lens Mount: X-Mount
- LCD: 3.0" tilting touchscreen

In the Box:
- Fujifilm XA5 Body
- Lens Kit
- Battery
- USB Cable
- Strap
''',
      colors: [Color(0xffEF9A9A), Color(0xffF48FB1), Color(0xffCE93D8)],
      peopleBuy: 65,
      owner: ProductOwner(img: 'assets/images/home_image/products/product1.png', name: 'Owner 1'),
    ),

    ProductModel(
      img: 'assets/images/home_image/products/product8.png',
      name: 'Cream Hoodie for Girls',
      price: '39.99',
      description: '''
Soft cream-colored hoodie made for comfort and daily wear. Perfect for cool weather.

Key Features:
- Cotton-polyester blend
- Front pockets and hood
- Relaxed fit
- Warm and breathable

Technical Specifications:
- Material: 60% Cotton, 40% Polyester
- Fit: Relaxed
- Sizes: XS to XL

In the Box:
- Cream Hoodie
- Label and care tag
''',
      colors: [Color(0xffFFF3E0), Color(0xffFFE0B2), Color(0xffFFCCBC)],
      peopleBuy: 152,
      owner: ProductOwner(img: 'assets/images/home_image/products/product1.png', name: 'Owner 1'),
    ),
  ];

  get count => productList.length;

  addProduct(ProductModel product) {
    productList.add(product);
  }
}

class ProductOwner {
  final String img;
  final String name;

  ProductOwner({required this.img,required this.name});
}
