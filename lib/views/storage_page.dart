import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/furniture_grid.dart';
import 'package:flutter_application_1/widgets/shoe.grid.dart';
import 'package:google_fonts/google_fonts.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Your Store',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500, color: Colors.black)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Furniture',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
          FurnitureItems(),
        ],
      ),
    );
  }
}
