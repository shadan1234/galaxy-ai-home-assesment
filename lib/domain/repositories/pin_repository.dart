import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/pin.dart';

abstract class PinRepository {
  Future<Either<Failure, List<Pin>>> getCuratedPhotos({int page = 1, int perPage = 15});
  Future<Either<Failure, List<Pin>>> searchPhotos({required String query, int page = 1, int perPage = 15});
  Future<Either<Failure, Pin>> getPhotoDetails(int id);
}
