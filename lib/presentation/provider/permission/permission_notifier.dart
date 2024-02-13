import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import 'permission_state.dart';

class PermissionNotifier extends StateNotifier<PermissionState> {
  PermissionNotifier() : super(PermissionState());

  Future<void> checkPermission() async {
    final permissionsArray = await Permission.location.status;

    if (permissionsArray == PermissionStatus.denied) {
      requestLocationAccess();
    }

    state = state.copyWith(
      location: permissionsArray,
    );
  }

  requestLocationAccess() async {
    final status = await Permission.location.request();
    state = state.copyWith(location: status);

    _checkPermissionState(status);
  }

  openSettings() {
    openAppSettings();
  }

  void _checkPermissionState(PermissionStatus status) {
    if (status == PermissionStatus.permanentlyDenied) {
      openSettings();
    }
  }
}
