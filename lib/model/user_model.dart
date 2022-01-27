class UserModel{

  String userEmail;
  String userName;
  String userPassword;
  String userPhone;
  String userWorkName;

  UserModel(this.userEmail,this.userPhone,this.userPassword,this.userName,this.userWorkName);

  UserModel.fromMapObject(Map<String, dynamic> map) {
    this.userEmail = map['UserEmail'];
    this.userName = map['UserName'];
    this.userPassword = map['UserPassword'];
    this.userPhone = map['UserPhone'];
    this.userWorkName = map['UserWorkName'];
  }
}