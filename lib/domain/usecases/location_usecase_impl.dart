import 'package:front_shop/domain/usecases/location_usecase.dart';
import 'package:front_shop/server/data/repository/location_repository.dart';

class LocationUsecaseImpl implements LocationUsecase {
  final LocationRepository _locationRepository;
  const LocationUsecaseImpl(this._locationRepository);
  @override
  Future<void> updateLocation(bool isLocationEnable) async {
    return await _locationRepository.updateLocation(isLocationEnable);
  }
}