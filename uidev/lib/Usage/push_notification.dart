
class PushNotification {
  PushNotification({
    this.id,
    this.title,
    this.body,
    this.dataTitle,
    this.dataBody,
  });

  int id;
  String title;
  String body;
  String dataTitle;
  String dataBody;

  factory PushNotification.fromJson(Map<String, dynamic> json) {
    return PushNotification(
      id: json["notification"]["id"],
      title: json["notification"]["title"],
      body: json["notification"]["body"],
      dataTitle: json["data"]["title"],
      dataBody: json["data"]["body"],
    );
  }
}