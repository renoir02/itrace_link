import 'package:itracelink/core/models/crop.dart';
import 'package:itracelink/core/services/http_client.dart';

class CropRepository {
  final HttpClient _client;

  CropRepository(this._client);

  Future<List<Crop>> getFarmerCrops(String farmerId) async {
    final response = await _client.get('/crops?farmerId=$farmerId');
    
    return (response['crops'] as List)
        .map((crop) => Crop.fromJson(crop))
        .toList();
  }

  Future<List<Crop>> searchCrops({
    CropType? type,
    String? location,
    DateTime? harvestDateFrom,
    DateTime? harvestDateTo,
  }) async {
    final queryParams = <String, String>{};
    
    if (type != null) queryParams['type'] = type.toString();
    if (location != null) queryParams['location'] = location;
    if (harvestDateFrom != null) {
      queryParams['harvestDateFrom'] = harvestDateFrom.toIso8601String();
    }
    if (harvestDateTo != null) {
      queryParams['harvestDateTo'] = harvestDateTo.toIso8601String();
    }

    final queryString = Uri(queryParameters: queryParams).query;
    final response = await _client.get('/crops/search?$queryString');

    return (response['crops'] as List)
        .map((crop) => Crop.fromJson(crop))
        .toList();
  }
}