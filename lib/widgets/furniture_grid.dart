import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/homepage_provider.dart';
import 'package:flutter_application_1/controller/wishlist_provider.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/service/authentication_services.dart';
import 'package:flutter_application_1/views/datils.dart';
import 'package:flutter_application_1/widgets/simmer_grid.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class FurnitureItems extends StatelessWidget {
  FurnitureItems({super.key});

  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Wishlist>(context);
    final homePro = Provider.of<HomeProvider>(context);
    return StreamBuilder<List<ProductModel>>(
      stream: homePro.getFurniture(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: ShimmerLoader(),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return SliverFillRemaining(
            child: Text(
              snapshot.error.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (snapshot.data == null) {
          return const SliverFillRemaining(
            child: CircularProgressIndicator(),
          );
        } else {
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                ProductModel product = data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(0.5),
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(3, 4),
                                  blurRadius: 2.5,
                                  color: Colors.black.withOpacity(0.2)),
                            ],
                            color: const Color.fromARGB(255, 29, 35, 46),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(product.image!, scale: 7))),
                        child: Stack(
                          children: [
                            // IconButton(onPressed: (){
                            //   Provider.of<Wishlist>(context,listen: false).addProductToWishlist(product, product.id.toString());
                            // }, icon: Icon(Icons.badge
                            // )),
                            Positioned(
                                left: 10,
                                top: 10,
                                child: Text(
                                  product.category!,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white, fontSize: 10),
                                )),
                            Positioned(
                                right: 10,
                                top: 10,
                                child: InkWell(
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/add-to-favorites.png'))),
                                  ),
                                  onTap: () {
                                    pro.addProductToWishlist(
                                        product, auth.auth.currentUser!.uid);
                                  },
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title ?? 'No title',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '${product.price}',
                                    style: GoogleFonts.montserrat(
                                        color: const Color.fromARGB(
                                            255, 9, 28, 10),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                right: 10,
                                bottom: 10,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.1),
                                  child: InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 13,
                                        color: Colors.white,
                                      )),
                                ))
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                  product: product,
                                )));
                      },
                    ),
                  ),
                );
              },
              childCount: data!.length,
            ),
          );
        }
      },
    );
  }
}
