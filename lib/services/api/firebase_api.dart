import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service_creed/models/post_model.dart';
import 'package:service_creed/services/api/channeli_api.dart';
import 'package:service_creed/services/utility_services.dart';

class FirebaseApi {
  FirebaseApi({this.uid});

  String uid;

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  AccessPair _getPairFromSnapshot(DocumentSnapshot snapshot) {
    return AccessPair(
        refresh: snapshot.data()['refresh'], access: snapshot.data()['access']);
  }

  Future postPair(AccessPair pair) async {
    return await usersCollection
        .doc(uid)
        .set({'refresh': pair.refresh, 'access': pair.access});
  }

  Future refreshPair(AccessPair pair) async {
    return await usersCollection
        .doc(uid)
        .update({'refresh': pair.refresh, 'access': pair.access});
  }

  Stream<AccessPair> get pair {
    return usersCollection.doc(uid).snapshots().map(_getPairFromSnapshot);
  }

  static Future<String> createPost(Post post) async {
    final docPost = FirebaseFirestore.instance.collection('post').doc();

    post.id = docPost.id;
    await docPost.set(post.toJson());

    return docPost.id;
  }

  static Stream<List<Post>> readPosts() => FirebaseFirestore.instance
      .collection('post')
      .orderBy(PostField.createdTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(Post.fromJson));
}
