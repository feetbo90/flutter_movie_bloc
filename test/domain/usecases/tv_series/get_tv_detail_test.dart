

import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv_series/get_detail_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_series/tv_dummy_objects.dart';
import '../../../helpers/test_helper_tv.mocks.dart';

void main() {
  late GetDetailTv getTvDetail;
  late MockTvSeriesRepository mockTvRepository;
  setUp(() {
    mockTvRepository = MockTvSeriesRepository();
    getTvDetail = GetDetailTv(mockTvRepository);
  });

  final tId = 1;
  test('should get movie detail from the repository', () async {
    ///arrange
    when(mockTvRepository.getDetailTv(tId))
        .thenAnswer((_) async => Right(testTvDetail));

    ///act
    final result = await getTvDetail.execute(tId);

    ///assert
    expect(result, Right(testTvDetail));
  });
}