import 'package:health/health.dart';

class HealthCareService {
  final HealthFactory health = HealthFactory();

  Future<List<HealthDataPoint>> getHealthDataFromTypes(
    DateTime startDate,
    DateTime endDate,
    List<HealthDataType> requestDataTypes,
  ) async {
    final healthData = await health.getHealthDataFromTypes(
      startDate,
      endDate,
      requestDataTypes,
    );

    // 重複データを除外したリストを返す
    return HealthFactory.removeDuplicates(healthData);
  }

  Future<bool?> hasPermissions(List<HealthDataType> requestDataTypes) async {
    return await health.hasPermissions(requestDataTypes);
  }

  Future<bool> requestAuthorization(List<HealthDataType> requestDataTypes) async {
    return await health.requestAuthorization(requestDataTypes);
  }
}
