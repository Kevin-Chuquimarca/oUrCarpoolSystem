import 'package:our_carpool/data/provider/university_provider.dart';

import '../data/model/university.dart';

class UniversityDomain {
  final UniversityProvider universityProvider = UniversityProvider();

  Future<List<University>> getUniversities() async {
    return await universityProvider.getUniversities();
  }
}
