class SocialUserModel {
  String? name;
  String? email;
  String? uId;
  String? phone;
  String? image;
  String? cover;
  String? bio;
  bool? IsEmailVerified;

  SocialUserModel(
            this.name,
            this.email,
            this.phone,
            this.uId,
            this.image,
            this.cover,
            this.bio,
            this.IsEmailVerified);
 
  SocialUserModel.fromJson(Map<String ,dynamic> json){
     email = json['email'];
    name = json['name'];
    uId = json['uId'];
    phone = json['phone'];
    image = json['image'];
     cover = json['cover'];
     bio = json['bio'];
    IsEmailVerified = json['IsEmailVerified'];
    }

  Map<String ,dynamic> toJson(){
    return{
      'name':name,
      'email':email,
      'uId':uId,
      'phone':phone,
      'image':image,
      'cover':cover,
      'IsEmailVerified':IsEmailVerified,
    };
  }

}