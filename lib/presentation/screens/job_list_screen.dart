import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_board_app/application/cubits/theme_cubit.dart';
import 'package:job_board_app/presentation/screens/saved_jobs_screen.dart';
import '../../application/cubits/job_cubit.dart';
import '../../data/models/job_model.dart';
import '../widgets/job_card.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({Key? key}) : super(key: key);

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<JobCubit>().fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: const Text('Job Listings'),
  centerTitle: true,
  actions: [
    IconButton(
      icon: const Icon(Icons.bookmarks),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SavedJobsScreen(),
          ),
        );
      },
    ),
     IconButton(
      icon: const Icon(Icons.brightness_6),
      onPressed: () {
        context.read<ThemeCubit>().toggleTheme();
      },
    )
  ],
      ),
      body: BlocBuilder<JobCubit, JobState>(
        builder: (context, state) {
          if (state is JobLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is JobLoaded) {
            final jobs = state.jobs;

            return ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return JobCard(job: jobs[index]);
              },
            );
          } else if (state is JobError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No jobs found.'));
          }
        },
      ),
    );
  }
}
