// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/shared/Cubit/cubit.dart';
import 'package:flutter_project/shared/Cubit/states.dart';
import 'package:flutter_project/shared/components/Components.dart';

class NewTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder:(context, state)
      {
        var tasks= AppCubit.get(context).newTasks;
            return tasksBuilder(tasks: tasks);
      },
    );


  }
  Widget buildTaskItem(Map model, context) => Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            child: Text(
              '${model['time']}',
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['title']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['date']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          IconButton(
            onPressed: ()
            {
              AppCubit.get(context).updateData(
                status: 'done',
                id: model['id'],
              );
            },
            icon: Icon(
              Icons.check_box,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: () {
              AppCubit.get(context).updateData(
                status: 'archive',
                id: model['id'],
              );
            },
            icon: Icon(
              Icons.archive,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    ),
    onDismissed: (direction)
    {
      AppCubit.get(context).deleteData(id: model['id'],);
    },
  );

}
