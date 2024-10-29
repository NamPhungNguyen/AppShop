import 'package:front_shop/server/client/client_service.dart';
import 'package:front_shop/server/data/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final ClientService _clientService;
  const LocationRepositoryImpl(this._clientService);
  @override
  Future<void> updateLocation(bool isLocationEnable) async {
    return await _clientService.updateLocation(isLocationEnable);
  }
}