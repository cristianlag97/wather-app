class LocationState {
  final bool isReady;
  final bool followUser;
  final double latitude;
  final double longitude;

  LocationState({
    this.isReady = false,
    this.followUser = false,
    this.latitude = 0,
    this.longitude = 0,
  });

  LocationState copyWith({
    bool? isReady,
    bool? followUser,
    double? latitude,
    double? longitude,
  }) =>
      LocationState(
        isReady: isReady ?? this.isReady,
        followUser: followUser ?? this.followUser,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );
}
