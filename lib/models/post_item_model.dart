class PostItemModel {
  final String postId;
  final String userId;
  final String userName;
  final String urlProfileImage;
  final String urlContentImage;
  final String description;
  final int quantityLikes;
  final int quantityRepost;
  final String date;

  PostItemModel({
    required this.postId,
    required this.userId,
    required this.userName,
    required this.urlProfileImage,
    required this.description,
    required this.urlContentImage,
    required this.quantityLikes,
    required this.quantityRepost,
    required this.date,
  });

  factory PostItemModel.fromRealTimeDataBase(Map<Object?, dynamic> data) {
    return PostItemModel(
      postId: data['postId'],
      userId: data['userId'],
      userName: data['userName'],
      urlProfileImage: data['urlProfileImage'],
      description: data['description'],
      urlContentImage: data['urlContentImage'],
      quantityLikes: data['quantityLikes'],
      quantityRepost: data['quantityRepost'],
      date: data['date'],
    );
  }

  Map<String, dynamic> toRealTimeDataBase() => {
        'postId': postId,
        'userId': userId,
        'userName': userName,
        'urlProfileImage': urlProfileImage,
        'description': description,
        'urlContentImage': urlContentImage,
        'quantityLikes': quantityLikes,
        'quantityRepost': quantityRepost,
        'date': date,
      };
}

class ListOfPostModel {
  final List<PostItemModel> listOfPosts;

  ListOfPostModel({required this.listOfPosts});

  factory ListOfPostModel.fromRealTimeDataBase(Map<Object?, dynamic> data) {
    return ListOfPostModel(
      listOfPosts: (data['posts'] as List<Object?>)
          .map((element) => PostItemModel.fromRealTimeDataBase(
              element as Map<Object?, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toRealTimeDataBse() {
    return {
      'posts': listOfPosts.map((e) => e.toRealTimeDataBase()).toList(),
    };
  }
}
