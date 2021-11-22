import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingCarousel extends StatelessWidget {
  final List _items = [
    ['Your news app', 'news.svg'],
    ['Push notifications', 'notifications.svg'],
    ['Beautiful design', 'design.svg'],
    ['Data charts', 'chart.svg'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.65,
            enlargeCenterPage: true,
            autoPlay: true,
            viewportFraction: 1.0),
        items: _items.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/${item[1]}',
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      item[0],
                      style: GoogleFonts.dancingScript(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
