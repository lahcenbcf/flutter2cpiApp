class UserModal {
  String ? fullName;
  String ? email;
  String ? password;
  String ? schoolYear;
  String ? userId;
  UserModal({
    this.fullName,this.email,this.password,this.schoolYear,this.userId
  });
  factory UserModal.fromJson(Map<String,dynamic> map){
    return UserModal(
      
        fullName:map["fullName"],
        email:map["email"] as String,
        password:map["password"] as String,
        schoolYear: map["schoolYear"] as String
    );
  }
  Map<String, dynamic> toMap(){
    return {
     "fullName":fullName,
     "email":email,
     "password":password,
     "schoolYear":schoolYear
    };
  }

}