class MessageModel {
  String? userMessage;
  String? botMessage;
  // late int answerCounting;

  //테스트 모델

  // late String user_id;
  // late String email;

  MessageModel({userMessage, botMessage});
  // BoardModel({user_id, email});

  MessageModel.fromJson(Map<String, dynamic> json) {
    userMessage = json['userMessage'];
    botMessage = json['botMessage'];
  }
}
