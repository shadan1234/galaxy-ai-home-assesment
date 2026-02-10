import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'datasources/remote/dio_client.dart';
import 'datasources/remote/pexels_api_service.dart';
import 'repositories/pin_repository_impl.dart';
import '../domain/repositories/pin_repository.dart';

part 'providers.g.dart';

@riverpod
DioClient dioClient(DioClientRef ref) {
  return DioClient();
}

@riverpod
PexelsApiService pexelsApiService(PexelsApiServiceRef ref) {
  final dioClient = ref.watch(dioClientProvider);
  return PexelsApiService(dioClient);
}

@riverpod
PinRepository pinRepository(PinRepositoryRef ref) {
  final apiService = ref.watch(pexelsApiServiceProvider);
  return PinRepositoryImpl(apiService);
}
