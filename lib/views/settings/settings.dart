import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/helpers.dart';
import 'package:flutter_application_1/service/authentication_services.dart';

import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  Settings({super.key});
  AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300]),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child:
                          //  ClipRRect(child: Lottie.asset(''),)
                          Icon(
                        Icons.person_outline_rounded,
                        size: 60,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 200,
                      child: Column(
                        children: [
                          Text(
                            auth.auth.currentUser!.displayName ?? '',
                            style: GoogleFonts.montserrat(
                                color: Colors.black, fontSize: 17),
                          ),
                          spacingHeight(10),
                          Text(auth.auth.currentUser!.email!,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                          spacingHeight(10),
                          Text(auth.auth.currentUser!.uid,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.only(left: 290,),
                    //   child: Icon(Icons.person,color: Colors.grey,size: 30,),
                    // ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 60,
            ),

            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                AuthService().signOut();
              },
              child: containers(
                text: 'Logout ',
              ),
            ),

            // Expanded(child: WishListPage()),
          ],
        ),
      ),
    );
  }

  Container containers({required String text}) {
    return Container(
      height: 60,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
