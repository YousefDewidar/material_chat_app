class ChatUserModel {
  String? id;
  String? name;
  String? email;
  String? about;
  String? image;
  String? createdAt;
  String? lastActivated;
  String? pushToken;
  bool? online;

  ChatUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.lastActivated,
    required this.pushToken,
    required this.online,
    required this.about,
    required this.image,
  });

  factory ChatUserModel.fromJson(Map<String, dynamic> json) {
    return ChatUserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        createdAt: json['created_at'],
        lastActivated: json['last_activated'],
        pushToken: json['push_token'],
        online: json['online'],
        about: json['about'],
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'created_at': createdAt,
      'last_activated': lastActivated,
      'push_token': pushToken,
      'online': online,
      'about': about,
      'image': image,
    };
  }
}
