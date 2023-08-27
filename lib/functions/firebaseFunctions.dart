import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {


  static saveUser(String name, email, uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': name});

    const productsCollection = "products";
    const cartCollection = "cart";
  }

  static getCart(String uid) {}

  static void deleteDocument(String id) {}



}
