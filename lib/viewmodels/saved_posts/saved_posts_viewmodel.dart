import 'package:service_creed/models/post_model.dart';
import 'package:service_creed/services/api/firebase_api.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class SavedPostsViewModel extends BaseViewModel {
  //TODO:(Dhruv) current version is only to display ui, actual savedposts<Post> will come from user-info, not from main posts database
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
