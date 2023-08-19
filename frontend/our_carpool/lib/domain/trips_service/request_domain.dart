import 'package:our_carpool/data/model/trips_service/request.dart';
import 'package:our_carpool/data/provider/trips_service/request_provider.dart';

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

  Future<bool> create(Request request) async {
    return await _requestProvider.post(request);
  }
}
