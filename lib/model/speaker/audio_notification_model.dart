class AudioNotificationModel {
  bool isAudioNotificationEnabled;

  AudioNotificationModel({this.isAudioNotificationEnabled = false});

  void toggleNotification() {
    isAudioNotificationEnabled = !isAudioNotificationEnabled;
  }
}