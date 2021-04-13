part of app_logger;

class DeviceRequestActionBlocOnCreated {
  final String action;
  final List<BlocRecord> payload;
  final DeviceInfo deviceInfo;
  final String project;
  final int sessionId;

  DeviceRequestActionBlocOnCreated({
    this.action = 'onCreate',
    @required this.payload,
    @required this.deviceInfo,
    @required this.project,
    @required this.sessionId,
  });

  Map<String, dynamic> toMap() {
    try {
      return {
        "action": action,
        "payload": payload,
        "deviceInfo": deviceInfo,
        "project": project,
        "sessionId": sessionId,
      };
    } catch (err) {
      return {
        "action": null,
        "payload": null,
        "deviceInfo": deviceInfo,
        "project": project,
        "sessionId": sessionId,
      };
    }
  }
}
