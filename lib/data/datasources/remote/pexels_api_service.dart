import 'package:dio/dio.dart';
import '../../models/pin_model.dart';
import 'dio_client.dart';

class PexelsApiService {
  final DioClient _dioClient;

  PexelsApiService(this._dioClient);

  Future<List<PinModel>> getCuratedPhotos({int page = 1, int perPage = 15}) async {
    try {
      final response = await _dioClient.get(
        '/curated',
        queryParameters: {
          'page': page,
          'per_page': perPage,
        },
      );
      final List<dynamic> photos = response.data['photos'];
      return photos.map((json) => PinModel.fromJson(json)).toList();
    } catch (e) {
      throw e;
    }
  }

  Future<List<PinModel>> searchPhotos({required String query, int page = 1, int perPage = 15}) async {
    try {
      final response = await _dioClient.get(
        '/search',
        queryParameters: {
          'query': query,
          'page': page,
          'per_page': perPage,
        },
      );
      final List<dynamic> photos = response.data['photos'];
      return photos.map((json) => PinModel.fromJson(json)).toList();
    } catch (e) {
      throw e;
    }
  }

  Future<PinModel> getPhotoDetails(int id) async {
    try {
      final response = await _dioClient.get('/photos/$id');
      return PinModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
}
