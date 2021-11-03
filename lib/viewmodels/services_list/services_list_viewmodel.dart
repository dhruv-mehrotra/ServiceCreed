import 'package:service_creed/models/post_model.dart';
import 'package:service_creed/services/api/firebase_api.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class ServicesListViewmodel extends BaseViewModel {
  List<Post> _posts = [];

  List<Post> get posts => _posts.toList();

  void setPosts(List<Post> posts) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _posts = posts;
        notifyListeners();
      });

  void addPost(Post post) {
    FirebaseApi.createPost(post);
  }
}
