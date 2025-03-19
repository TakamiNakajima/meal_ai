import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:meal_ai/infrastructure/repository/health_repository.dart';

final healthCareUseCase = Provider.autoDispose(
  (ref) => HealthCareUseCase(
    healthRepository: ref.read(healthRepository),
  ),
);

class HealthCareUseCase {
  HealthCareUseCase({
    required HealthRepository healthRepository,
  }) : _healthRepository = healthRepository;

  final HealthRepository _healthRepository;

  /// ヘルスケアから歩数を取得する処理
  Future<void> fetchStepFromHealthcare(
    DateTime startDate,
    DateTime endDate,
    String userID,
  ) async {
    List<HealthDataType> requestDataTypes = [
      HealthDataType.STEPS,
      HealthDataType.DISTANCE_WALKING_RUNNING,
    ];

    // ヘルスケアから歩数を取得する
    final healthData = await _healthRepository.getHealthDataFromHealthcare(
      startDate,
      endDate,
      requestDataTypes,
    );

    // 一つの記録端末でフィルタリング
    final filteredHealthData = _filterStepsData(healthData);

    // List<Map>型に変換
    final healthDataList = _convertToMap(filteredHealthData);

    // DBに保存する
    await _healthRepository.saveToFireStore(healthDataList, userID);
  }

  /// 取得した歩数データが複数のソース(記録端末)から記録されている場合、一つのソースでフィルタリングする
  /// 複数端末で記録した歩数を合計すると倍になってしまうための対処
  static List<HealthDataPoint> _filterStepsData(List<HealthDataPoint> data) {
    List<HealthDataPoint> filteredList = [];

    // 一つ目の歩数データを記録した端末(SourceId)でフィルタリング
    for (var newData in data) {
      if (newData.type == HealthDataType.STEPS && filteredList.isNotEmpty) {
        final isSameDevice = filteredList.any((filteredData) => (newData.sourceId == filteredData.sourceId));
        if (isSameDevice) {
          filteredList.add(newData);
        }
      } else {
        filteredList.add(newData);
      }
    }
    return filteredList;
  }

  /// 端末から取得したList<HealthData>をList<Map>に変換する
  List<Map<String, dynamic>> _convertToMap(List<HealthDataPoint> list) {
    final dateList = [];
    for (final data in list) {
      dateList.add(data.dateFrom.toString().substring(0, 10));
    }
    List<Map<String, dynamic>> dataList = [];
    for (final date in [
      ...{...dateList}
    ]) {
      final data = list.where((e) => e.dateFrom.toString().contains(date)).toList();
      final processedData = [];
      for (var i = 0; i < data.length; i++) {
        final d = data[i].toJson();
        processedData.add(d);
      }
      final dataMap = <String, dynamic>{'dateTime': date, 'dataList': processedData};
      dataList.add(dataMap);
    }
    return dataList;
  }
}
