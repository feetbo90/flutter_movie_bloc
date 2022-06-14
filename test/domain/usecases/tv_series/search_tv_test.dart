import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/usecases/tv_series/search_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper_tv.mocks.dart';


void main() {
  late SearchTv usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = SearchTv(mockTvSeriesRepository);
  });

  final tv = <Tv>[];
  final tQuery = 'Obi';

  test('should get list of tv from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.searchTv(tQuery))
        .thenAnswer((_) async => Right(tv));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tv));
  });
}
