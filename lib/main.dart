import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_board_app/application/cubits/job_cubit.dart';
import 'package:job_board_app/application/cubits/saved_job_cubit.dart';
import 'package:job_board_app/application/cubits/theme_cubit.dart';
import 'package:job_board_app/data/services/job_service.dart';
import 'package:job_board_app/presentation/screens/job_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final JobService _jobService = JobService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => JobCubit(_jobService)),
        BlocProvider(create: (_) => SavedJobCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Job Board',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeMode,
            home: JobListScreen(),
          );
        },
      ),
    );
  }
}