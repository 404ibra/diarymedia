/*
{
    "user_email": "diapublic@gmail.com",
    "user_name": "ibrahim",
    "user_username": "@ibrahim",
    "user_gender": "man",
    "user_birthday": "2231",
    "user_birthday_anonymous": false,
    "user_profile_image_url": ""
}
 */
class UserModel {
  String? userEmail;
  String? userName;
  String? userUsername;
  String? userGender;
  String? userBirthday;
  bool? userBirthdayAnonymous;
  String? userProfileImageUrl;

  UserModel(
      {this.userEmail,
      this.userName,
      this.userUsername,
      this.userGender,
      this.userBirthday,
      this.userBirthdayAnonymous,
      this.userProfileImageUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    userEmail = json['user_email'];
    userName = json['user_name'];
    userUsername = json['user_username'];
    userGender = json['user_gender'];
    userBirthday = json['user_birthday'];
    userBirthdayAnonymous = json['user_birthday_anonymous'];
    userProfileImageUrl = json['user_profile_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_email'] = this.userEmail;
    data['user_name'] = this.userName;
    data['user_username'] = this.userUsername;
    data['user_gender'] = this.userGender;
    data['user_birthday'] = this.userBirthday;
    data['user_birthday_anonymous'] = this.userBirthdayAnonymous;
    data['user_profile_image_url'] = this.userProfileImageUrl;
    return data;
  }
}
