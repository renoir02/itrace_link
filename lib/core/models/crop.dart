enum CropType {
  maize,
  beans,
  sweetPotato,
  cassava,
  rice
}

class Crop {
  final String id;
  final String farmerId;
  final CropType type;
  final double quantity;
  final String unit;
  final DateTime harvestDate;
  final String seedSource;
  final Map<String, dynamic> nutritionalInfo;
  final bool isBiofortified;

  Crop({
    required this.id,
    required this.farmerId,
    required this.type,
    required this.quantity,
    required this.unit,
    required this.harvestDate,
    required this.seedSource,
    required this.nutritionalInfo,
    required this.isBiofortified,
  });

  factory Crop.fromJson(Map<String, dynamic> json) {
    return Crop(
      id: json['id'],
      farmerId: json['farmerId'],
      type: CropType.values.firstWhere(
        (type) => type.toString() == json['type'],
      ),
      quantity: json['quantity'].toDouble(),
      unit: json['unit'],
      harvestDate: DateTime.parse(json['harvestDate']),
      seedSource: json['seedSource'],
      nutritionalInfo: json['nutritionalInfo'],
      isBiofortified: json['isBiofortified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'farmerId': farmerId,
      'type': type.toString(),
      'quantity': quantity,
      'unit': unit,
      'harvestDate': harvestDate.toIso8601String(),
      'seedSource': seedSource,
      'nutritionalInfo': nutritionalInfo,
      'isBiofortified': isBiofortified,
    };
  }
}