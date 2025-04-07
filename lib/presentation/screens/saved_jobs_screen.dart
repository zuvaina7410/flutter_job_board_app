import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/cubits/saved_job_cubit.dart';
import '../widgets/job_card.dart';

class SavedJobsScreen extends StatelessWidget {
  const SavedJobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final savedJobs = context.watch<SavedJobCubit>().state;

    return Scaffold(
      appBar: AppBar(title: const Text('Saved Jobs')),
      body: savedJobs.isEmpty
          ? const Center(child: Text('No saved jobs.'))
          : ListView.builder(
              itemCount: savedJobs.length,
              itemBuilder: (context, index) {
                return JobCard(job: savedJobs[index]);
              },
            ),
    );
  }
}
