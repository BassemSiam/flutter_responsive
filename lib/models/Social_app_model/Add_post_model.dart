class PostModel {
  String? name;
  String? uId;
  String? image;
  String? dataTime;
  String? text;
  String? postImage;

  PostModel(
      this.name,
      this.dataTime,
      this.text,
      this.uId,
      this.image,
      this.postImage,
      );

  PostModel.fromJson(Map<String ,dynamic> json){
    dataTime = json['dataTime'];
    name = json['name'];
    uId = json['uId'];
    text = json['text'];
    image = json['image'];
    postImage = json['postImage'];

  }

  Map<String ,dynamic> toJson(){
    return{
      'name':name,
      'dataTime':dataTime,
      'uId':uId,
      'text':text,
      'image':image,
      'postImage':postImage,
    };
  }

}