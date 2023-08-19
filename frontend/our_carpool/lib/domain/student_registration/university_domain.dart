import 'package:our_carpool/data/provider/student_registration/university_provider.dart';

import '../../data/model/student_registration/university.dart';

class UniversityDomain {
  final UniversityProvider universityProvider = UniversityProvider();

  Future<List<University>> getUniversities() async {
    return await universityProvider.getUniversities();
  }
}
