class MessageModel {
  String message;
  bool isFromUser;
  DateTime createdAt;
  DateTime updatedAt;

  MessageModel({
    required this.message,
    required this.isFromUser,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'isFromUser': isFromUser,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}