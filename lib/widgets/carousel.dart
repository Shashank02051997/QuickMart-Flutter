import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  Carousel({Key? key}) : super(key: key);

  final List<AssetImage> imgList = [
    AssetImage('assets/images/banner1.webp'),
    AssetImage('assets/images/banner2.webp'),
    AssetImage('assets/images/banner3.webp'),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      item.assetName,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width - 48,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
    return RepaintBoundary(
      child: CarouselSlider(
        options: CarouselOptions(
            viewportFraction: 0.9,
            aspectRatio: 4,
            enableInfiniteScroll: true,
            initialPage: 2,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5)),
        items: imageSliders,
      ),
    );
  }
}
