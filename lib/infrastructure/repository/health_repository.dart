import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:meal_ai/infrastructure/service/firestore_service.dart';
import 'package:meal_ai/infrastructure/service/healthcare_service.dart';

final healthRepository = Provider(
  (ref) => HealthRepository(
    healthcareService: HealthCareService(),
    fireStoreService: FireStoreService(),
  ),
);

class HealthRepository {
  static HealthRepository? _instance;
  final HealthCareService _healthcareService;
  final FireStoreService _fireStoreService;

  HealthRepository._internal({
    required HealthCareService healthcareService,
    required FireStoreService fireStoreService,
  })  : _healthcareService = healthcareService,
        _fireStoreService = fireStoreService;

  factory HealthRepository({
    required HealthCareService healthcareService,
    required FireStoreService fireStoreService,
  }) {
    return _instance ??= HealthRepository._internal(
      healthcareService: healthcareService,
      fireStoreService: fireStoreService,
    );
  }

  /// Healthデータを取得する
  Future<List<HealthDataPoint>> getHealthDataFromHealthcare(
    DateTime startDate,
    DateTime endDate,
    List<HealthDataType> requestDataTypes,
  ) async {
    if (Platform.isAndroid) return [];

    final bool accessWasGranted = await _healthcareService.requestAuthorization(requestDataTypes);
    if (accessWasGranted) {
      return await _healthcareService.getHealthDataFromTypes(startDate, endDate, requestDataTypes);
    }
    return [];
  }

  /// Healthデータを保存する
  Future<void> saveToFireStore(List<Map<String, dynamic>> healthData, String userID) async {
    if (healthData.isEmpty) return;

    await _fireStoreService.setAllHealthData(healthDataList: healthData, userId: userID);
  }
}
