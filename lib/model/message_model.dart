class MessageModel {
  late String userMessage;
  late String botMessage;
  // late int answerCounting;

  //테스트 모델

  // late String user_id;
  // late String email;

  MessageModel({required this.userMessage, required this.botMessage});
  // BoardModel({user_id, email});

  MessageModel.fromJson(Map<String, dynamic> json) {
    userMessage = json['userMessage'];
    botMessage = json['botMessage'];
  }
}
