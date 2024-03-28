class GenerateAgoraTokenResModel {
  String? agoraUserId;
  String? agoraUsername;
  String? token;

  GenerateAgoraTokenResModel(
      {this.agoraUserId, this.agoraUsername, this.token});

  GenerateAgoraTokenResModel.fromJson(Map<String, dynamic> json) {
    agoraUserId = json['agora_user_id'];
    agoraUsername = json['agora_username'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agora_user_id'] = this.agoraUserId;
    data['agora_username'] = this.agoraUsername;
    data['token'] = this.token;
    return data;
  }
}
