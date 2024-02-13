import 'package:permission_handler/permission_handler.dart';

class PermissionState {
  final PermissionStatus location;

  PermissionState({
    this.location = PermissionStatus.denied,
  });

  PermissionState copyWith({
    PermissionStatus? location,
  }) =>
      PermissionState(
        location: location ?? this.location,
      );

  get locationGranted {
    return location == PermissionStatus.granted;
  }
}
