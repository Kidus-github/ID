class NfcDeviceModule {
  final String? deviceId;
  final String deviceName;
  final String deviceLocation;
  final String assignedTo;
  final DateTime createdAt;

  NfcDeviceModule(
      {required this.deviceName,
      required this.assignedTo,
      required this.createdAt,
      required this.deviceLocation,
      this.deviceId});

  toJson() {
    return {
      "DeviceID": deviceId,
      "DeviceName": deviceName,
      "DeviceLocation": deviceLocation,
      "CreatedAt": createdAt,
      "AssignedTo": assignedTo,
    };
  }
}
