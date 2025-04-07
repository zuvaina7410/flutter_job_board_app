import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/job_model.dart';
import '../../data/services/job_service.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  final JobService _jobService;

  JobCubit(this._jobService) : super(JobInitial());

  Future<void> fetchJobs() async {
    emit(JobLoading());
    try {
      final jobs = await _jobService.fetchJobs();
      emit(JobLoaded(jobs));
    } catch (e) {
      emit(JobError("Failed to fetch jobs"));
    }
  }
}
