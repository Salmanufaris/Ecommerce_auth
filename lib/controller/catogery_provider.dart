import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/service/firebase_services.dart';

class CategoryProvider extends ChangeNotifier {
  DatabaseService service = DatabaseService();
  List<ProductModel> items = [];
  Future<List<ProductModel>> getCategoryItems(
      {required String type, required String typeofcategory}) async {
    try {
      var categorySnapshot = await service.firestore
          .collection("category")
          .doc(type)
          .collection(typeofcategory)
          .get();
      items = categorySnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
      return items;
    } catch (e) {
      print('Error fetching wishlist items: $e');
      throw e;
    }
  }
}
