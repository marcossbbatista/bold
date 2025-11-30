import 'package:bold/utils/images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 40,
          child: Image.asset('assets/bold.png', fit: BoxFit.contain),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: images
                .map(
                  (item) => Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(item),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 350,
              autoPlay: false,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images
                .asMap()
                .entries
                .map(
                  (item) => Container(
                    height: 12,
                    width: 12,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == item.key
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
