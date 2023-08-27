import 'package:ecommerce_shopping_app/functions/firebase_consts.dart';

class FirestoreServices{

  static getUser(uid){
    return firestore
        .collection(usersCollection)
        .where('id',isEqualTo: uid)
        .snapshots();
  }

  static getProducts(category){
    return firestore
        .collection(productsCollection)
        .where('p_category',isEqualTo: category)
        .snapshots();
  }

  static getCart(uid){
    return firestore
        .collection(cartCollection)
        .where('added_by',isEqualTo: uid)
        .snapshots();
  }

  static deleteDocument(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
  }
  
  static getCounts() async{
    var res = await Future.wait([
      firestore.collection(cartCollection).where('added_by', isEqualTo: currentUser!.uid).get().then((value) {
       return value.docs.length;
      }),
      firestore.collection(cartCollection).where('added_by', isEqualTo: currentUser!.uid).get().then((value) {
        return value.docs.length;
      }),
      firestore.collection(cartCollection).where('added_by', isEqualTo: currentUser!.uid).get().then((value) {
        return value.docs.length;
      }),
    ]);
    return res;
  }

  static getFeaturedProducts(){
    return firestore.collection(productsCollection).where('is_featured', isEqualTo: true).get();
  }
}