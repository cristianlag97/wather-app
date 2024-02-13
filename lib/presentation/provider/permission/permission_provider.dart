import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_and_weather_app/presentation/provider/permission/permission_notifier.dart';
import 'package:time_and_weather_app/presentation/provider/permission/permission_state.dart';

final permissionProvider =
    StateNotifierProvider<PermissionNotifier, PermissionState>((ref) {
  return PermissionNotifier();
});
