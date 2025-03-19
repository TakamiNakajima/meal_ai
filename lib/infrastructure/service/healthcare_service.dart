import 'package:health/health.dart';

class HealthCareService {
  final HealthFactory health = HealthFactory();

  Future<List<HealthDataPoint>> getHealthDataFromTypes(
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

  Future<bool?> hasPermissions(List<HealthDataType> requestDataTypes) async {
    return await health.hasPermissions(requestDataTypes);
  }

  Future<bool> requestAuthorization(List<HealthDataType> requestDataTypes) async {
    return await health.requestAuthorization(requestDataTypes);
  }
}
