class UniversityLocation {
  final String name;
  final double latitude;
  final double longitude;

  UniversityLocation({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  UniversityLocation.empty()
      : name = '',
        latitude = 0,
        longitude = 0;
}

List<UniversityLocation> universitiesLocation = [
  UniversityLocation(
    name: 'Universidad de las Fuerzas Armadas ESPE',
    latitude: -0.314708,
    longitude: -78.442252,
  ),
  UniversityLocation(
    name: 'Universidad de las Americas UDLA',
    latitude: -0.162658,
    longitude: -78.459584,
  ),
  UniversityLocation(
    name: 'Universidad Central del Ecuador UCE',
    latitude: -0.200505,
    longitude: -78.501164,
  )
];
