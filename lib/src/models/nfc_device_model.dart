class NfcDeviceModule {
  final String? deviceId;
  final String ownerId;
  final String deviceName;
  // final String deviceLocation;
  final String assignedTo;
  final DateTime createdAt;

  NfcDeviceModule(
      {required this.ownerId,
      required this.deviceName,
      required this.assignedTo,
      required this.createdAt,
      // required this.deviceLocation,
      this.deviceId});

  toJson() => {
        "DeviceID": deviceId,
        "OwnerID": ownerId,
        "DeviceName": deviceName,
        // "DeviceLocation": deviceLocation,
        "CreatedAt": createdAt,
        "AssignedTo": assignedTo,
      };
}
