import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/job_model.dart';
import '../../application/cubits/saved_job_cubit.dart';

class JobDetailScreen extends StatelessWidget {
  final JobModel job;

  const JobDetailScreen({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSaved = context.watch<SavedJobCubit>().isSaved(job);

    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
        actions: [
          IconButton(
            icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_border),
            onPressed: () {
              context.read<SavedJobCubit>().toggleSave(job);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.company, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(job.location, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
            Text("Job Description", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(job.description),
          ],
        ),
      ),
    );
  }
}
