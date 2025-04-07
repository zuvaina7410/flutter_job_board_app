import 'package:dio/dio.dart';
import '../models/job_model.dart';

class JobService {
  final Dio _dio = Dio();

  // Dummy API URL (you can use your own mock API too)
  final String apiUrl = 'https://mocki.io/v1/7f44afbc-f190-4db9-9fc8-0d7ab405dbba';

  Future<List<JobModel>> fetchJobs() async {
    try {
      final response = await _dio.get(apiUrl);

      final data = response.data as List;

      return data.map((job) => JobModel.fromJson(job)).toList();
    } catch (e) {
      throw Exception('Failed to fetch jobs: $e');
    }
  }
}
