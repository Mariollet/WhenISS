class IssLocation {
  IssLocation({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  factory IssLocation.fromJson(final Map<String, dynamic> json) {
    return IssLocation(
      latitude: double.parse(json["iss_position"]["latitude"]),
      longitude: double.parse(json["iss_position"]["longitude"]),
    );
  }
}
