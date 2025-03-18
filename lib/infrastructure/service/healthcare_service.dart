import 'package:health/health.dart';

class HealthCareService {
  static final HealthCareService _instance = HealthCareService._internal();

  HealthCareService._internal();

  factory HealthCareService() {
    return _instance;
  }

  static final HealthFactory health = HealthFactory();

  Future<List<HealthDataPoint>> getHealthDataFromDevice(
    DateTime startDate,
    DateTime endDate,
    List<HealthDataType> requestDataTypes,
  ) async {
    return await health.getHealthDataFromTypes(
      startDate,
      endDate,
      requestDataTypes,
    );
  }

  Future<bool?> hasPermission(List<HealthDataType> requestDataTypes) async {
    return await health.hasPermissions(requestDataTypes);
  }

  Future<bool> requestAuthorization(List<HealthDataType> requestDataTypes) async {
    return await health.requestAuthorization(requestDataTypes);
  }
}
