import 'package:our_carpool/data/model/trip-service/request.dart';
import 'package:our_carpool/data/provider/trip-service/request_provider.dart';

class RequestDomain {
  final RequestProvider _requestProvider = RequestProvider();

  Future<List<Request>> getByIdDri(int idDri) async {
    return await _requestProvider.getByIdDri(idDri);
  }

  Future<bool> accept(int id) async {
    return await _requestProvider.accept(id);
  }

  Future<bool> deny(int id) async {
    return await _requestProvider.deny(id);
  }
}