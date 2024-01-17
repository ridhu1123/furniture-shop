class UserModel{
  final String id;
  String name;
  
  final String email;
  String phonenumber;
  UserModel({required this.id,required this.name,required this.email,required this.phonenumber});

  Map<String,dynamic> toJson(){
    return{
      "Fullname":name,
      "email":email,
      "phonenumber":phonenumber
    };
  }
}