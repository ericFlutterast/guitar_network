class UserData {
  String uid;
  String firstName;
  String secondName;
  String phoneNumber;
  String userCity;
  String aboutMe;
  String experience;
  String img;

  UserData({
    this.uid = '',
    this.firstName = '',
    this.secondName = '',
    this.phoneNumber = '',
    this.userCity = '',
    this.aboutMe = '',
    this.experience = '',
    this.img = '',
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      uid: json['uid'],
      firstName: json['firstName'],
      secondName: json['secondName'],
      phoneNumber: json['phoneNumber'],
      userCity: json['userCity'],
      aboutMe: json['aboutMe'],
      experience: json['experience'],
    );
  }
}
