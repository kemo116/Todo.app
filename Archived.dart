// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/shared/Cubit/cubit.dart';
import 'package:flutter_project/shared/Cubit/states.dart';
import 'package:flutter_project/shared/components/Components.dart';

class Archived extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder:(context, state)
      {
        var tasks= AppCubit.get(context).archivedTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
