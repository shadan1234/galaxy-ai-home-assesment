import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/error/failures.dart';
import '../../../domain/entities/pin.dart';
import '../../../domain/repositories/pin_repository.dart';
import '../datasources/remote/pexels_api_service.dart';

class PinRepositoryImpl implements PinRepository {
  final PexelsApiService _apiService;

  PinRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, List<Pin>>> getCuratedPhotos({int page = 1, int perPage = 15}) async {
    try {
      final result = await _apiService.getCuratedPhotos(page: page, perPage: perPage);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Unknown Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Pin>>> searchPhotos({required String query, int page = 1, int perPage = 15}) async {
    try {
      final result = await _apiService.searchPhotos(query: query, page: page, perPage: perPage);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Unknown Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Pin>> getPhotoDetails(int id) async {
    try {
      final result = await _apiService.getPhotoDetails(id);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Unknown Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
