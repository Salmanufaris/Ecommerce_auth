// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/homepage_provider.dart';
import 'package:flutter_application_1/helpers/helpers.dart';
import 'package:flutter_application_1/service/authentication_services.dart';
import 'package:flutter_application_1/widgets/catoegry_list.dart';
import 'package:flutter_application_1/widgets/furniture_grid.dart';
import 'package:flutter_application_1/widgets/shoe.grid.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getCurrentUser();
  }

  final List<String> images = [
    'assets/offers.jpg',
    'assets/offer2.jpg',
    'assets/shoeoffers.jpg',
    'assets/chocolates.jpg',
    'assets/lipsticks.jpg',
    'assets/plants.jpg',
    'assets/bags (1).jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Hello..',
                          style: GoogleFonts.montserrat(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      Image.asset(
                        'assets/handwave.jpg',
                        height: 20,
                      ),
                      spacingWidth(10),
                      Text(Provider.of<HomeProvider>(context).currentusername,
                          style: GoogleFonts.montserrat(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Start',
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.green,
                      ),
                      spacingWidth(10),
                      Text('Shopping',
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: images.map((String imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 29, 35, 46),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(imageUrl))),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
          ),
          Categories(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Choose your',
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      spacingWidth(10),
                      Text('Products',
                          style: GoogleFonts.montserrat(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                  Text('Sports',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
          ShoeItems(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('Furniture',
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
          ),
          FurnitureItems(),
        ],
      ),
    );
  }
}
