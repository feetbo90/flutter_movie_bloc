import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_top_rated.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper_tv.mocks.dart';

void main() {
  late GetTvTopRated usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetTvTopRated(mockTvSeriesRepository);
  });

  final tv = <Tv>[];

  test('should get list of tv from repository', () async {
    // arrange
    when(mockTvSeriesRepository.getTvTopRated())
        .thenAnswer((_) async => Right(tv));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tv));
  });
}
