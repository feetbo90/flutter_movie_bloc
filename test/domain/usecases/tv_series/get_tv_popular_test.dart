import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series/tv.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_popular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper_tv.mocks.dart';


void main() {
  late GetTvPopular usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetTvPopular(mockTvSeriesRepository);
  });

  final tv = <Tv>[];

  group('GetPopularTv Tests', () {
    group('execute', () {
      test(
          'should get list of tv from the repository when execute function is called',
              () async {
            // arrange
            when(mockTvSeriesRepository.getTvPopular())
                .thenAnswer((_) async => Right(tv));
            // act
            final result = await usecase.execute();
            // assert
            expect(result, Right(tv));
          });
    });
  });
}
