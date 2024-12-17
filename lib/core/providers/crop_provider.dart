import 'package:flutter/foundation.dart';
import 'package:itracelink/core/models/crop.dart';
import 'package:itracelink/core/repositories/crop_repository.dart';

class CropProvider with ChangeNotifier {
  final CropRepository _repository;
  List<Crop> _crops = [];
  bool _isLoading = false;
  String? _error;

  CropProvider(this._repository);

  List<Crop> get crops => _crops;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getFarmerCrops(String farmerId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _crops = await _repository.getFarmerCrops(farmerId);
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> searchCrops({
    CropType? type,
    String? location,
    DateTime? harvestDateFrom,
    DateTime? harvestDateTo,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _crops = await _repository.searchCrops(
        type: type,
        location: location,
        harvestDateFrom: harvestDateFrom,
        harvestDateTo: harvestDateTo,
      );
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
    }
  }
}