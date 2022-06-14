
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_recommendation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper_tv.mocks.dart';


void main() {
  late GetTvRecommendation usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetTvRecommendation(mockTvSeriesRepository);
  });

  final tId = 1;
  final tv = <Tv>[];

  test('should get list of tv recommendations from the repository',
          () async {
        // arrange
        when(mockTvSeriesRepository.getTvRecommendation(tId))
            .thenAnswer((_) async => Right(tv));
        // act
        final result = await usecase.execute(tId);
        // assert
        expect(result, Right(tv));
      });
}