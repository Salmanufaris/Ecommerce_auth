import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/catogery_model.dart';
import 'package:flutter_application_1/model/product_model.dart';

class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final CollectionReference<ProductModel> productsRef;
  DatabaseService() {
    productsRef = firestore.collection("sports").withConverter<ProductModel>(
          fromFirestore: (snapshot, snapshotOptions) =>
              ProductModel.fromJson(snapshot.data()!),
          toFirestore: (data, setOptions) => data.toJson(),
        );
  }
}

class DatabaseService1 {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final CollectionReference<ProductModel> furniteref;
  DatabaseService1() {
    furniteref = firestore.collection("furniture").withConverter<ProductModel>(
          fromFirestore: (snapshot, snapshotOptions) =>
              ProductModel.fromJson(snapshot.data()!),
          toFirestore: (data, setOptions) => data.toJson(),
        );
  }
}

class DatabaseService2 {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final CollectionReference<CategoryModel> catref;

  DatabaseService2() {
    catref = firestore.collection("category").withConverter<CategoryModel>(
          fromFirestore: (snapshot, snapshotOptions) =>
              CategoryModel.fromJson(snapshot.data()!),
          toFirestore: (data, setOptions) => data.toJson(),
        );
  }
}
