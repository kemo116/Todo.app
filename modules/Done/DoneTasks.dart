// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/shared/Cubit/cubit.dart';
import 'package:flutter_project/shared/Cubit/states.dart';
import 'package:flutter_project/shared/components/Components.dart';

class DoneTasks extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder:(context, state)
      {
        var tasks= AppCubit.get(context).doneTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
