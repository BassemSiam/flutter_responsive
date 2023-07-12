class MessageModel {
  String? senderId;
  String? receiverId;
  String? dateTime;
  String? text;

  MessageModel({
      this.senderId,
      this.receiverId,
      this.dateTime,
      this.text,}
      );

  MessageModel.fromJson(Map<String ,dynamic> json){
    receiverId = json['receiverId'];
    senderId = json['senderId'];
    text = json['text'];
    dateTime = json['dataTime'];

  }

  Map<String ,dynamic> toJson(){
    return{
      'senderId':senderId,
      'receiverId':receiverId,
      'text':text,
      'dataTime':dateTime,
    };
  }

}