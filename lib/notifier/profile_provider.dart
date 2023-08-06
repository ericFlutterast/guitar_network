import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/models/post_item_model.dart';
import 'package:guitar_network_vkr/services/cloud_firestore.dart';
import 'package:guitar_network_vkr/services/firebase_realtime_database_serveces.dart';
import 'package:guitar_network_vkr/services/make_id.dart';
import 'package:guitar_network_vkr/services/storage_services.dart';
import '../models/user_data.dart';
import '../services/image_controll_services.dart';
import '../widgets/posts/news_item.dart';

class ProfileProvider extends ChangeNotifier {
  final Storage _storage = Storage();

  List<PostItemModel> _listOfNews = [];
  MakeId makeId = MakeId();
  FirebaseRealtimeDatabase database = FirebaseRealtimeDatabase();
  String _imageURL = '';
  File? _newImage;
  UserData _userData = UserData();

  UserData? get userData => _userData;
  File? get newProfileImage => _newImage;
  String get imageURL => _imageURL;

  bool updateFlag(bool flag) {
    return flag ? false : true;
  }

  void initData(String uid) async {
    _userData = await CloudFirestore().userDataFromFirestore(uid);
    _imageURL = await Storage().downloandStorage(_userData.uid, 'avatars');

    notifyListeners();
  }

  Future<void> loadImage() async {
    _newImage = await ImageControllServices().imgFromGallery();

    notifyListeners();
  }

  void updateProfileData() {
    String fileName = _userData.uid;
    _storage.upLoadStorage(_newImage, fileName, 'avatars');
    notifyListeners();
  }

  void addPost(String description) async {
    String postId = makeId.makeIdFrom28().toString();
    String tempDate = DateTime.now().toString().substring(0, 10);
    String dateTime = '${DateTime.now().toString().substring(11, 16)} ';

    tempDate.split('-').reversed.forEach((element) {
      dateTime = '${dateTime + element}.';
    });

    dateTime = dateTime.substring(0, dateTime.length - 1);

    PostItemModel post = PostItemModel(
      postId: postId,
      userId: _userData.uid,
      userName: '${_userData.firstName} ${_userData.secondName}',
      urlProfileImage: _imageURL,
      description: description,
      urlContentImage: '',
      quantityLikes: 0,
      quantityRepost: 0,
      date: dateTime,
    );

    _listOfNews.add(post);

    database.addPost(postId, _listOfNews);

    _newImage = null;
    notifyListeners();
  }

  List<NewsItem> getListOfNewsForProfilePage() {
    List<NewsItem> resultList = [];

    for (var element in _listOfNews) {
      if (element.userId == _userData.uid) {
        resultList.add(
          NewsItem(
              userName: element.userName,
              urlContentImage: element.urlContentImage,
              urlProfileImage: element.urlProfileImage,
              description: element.description,
              date: element.date,
              quantityLikes: element.quantityLikes,
              quantityRepost: element.quantityRepost),
        );
      }
    }

    return resultList;
  }

  List<PostItemModel> getListOfNewsForNewsPage() {
    return _listOfNews;
  }
}
