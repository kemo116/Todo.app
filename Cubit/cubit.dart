import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/modules/ArchivedTasks/Archived.dart';
import 'package:flutter_project/modules/Done/DoneTasks.dart';
import 'package:flutter_project/modules/NewTasks/NewTasks.dart';
import 'package:flutter_project/shared/Cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
static AppCubit get(context)=> BlocProvider.of(context);
  int currentIndex=0;

  List<Widget>screens = [
    NewTasks(),
    DoneTasks(),
    Archived(),
  ];

  List<String > titles= [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  Database? database;
  List <Map> newTasks=[];
  List <Map> doneTasks=[];
  List <Map> archivedTasks=[];
  void changeIndex(int index){
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
  void getDataFromDatabase (database) {
     emit(GetDatabaseLoadingState());
     database.rawQuery('SELECT * FROM tasks').then((value){

       value.forEach((element) {
         if(element['status']=='new'){
           newTasks.add(element);
         }else if(element['status']=='done'){
           doneTasks.add(element);
         }else {archivedTasks.add(element);
         }
       });
       emit(GetDatabaseState());
       
     });
  }
  void updateData({
    required String status,
    required int id,
})
  async{
    database!.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]
     ).then((value){
      emit(UpdateDatabaseState());
    });
  }
  void deleteData({
    required int id,
  })
  async{
    database!.rawUpdate(
        'DELETE FROM tasks WHERE id = ?',
        [id]
    ).then((value){
      emit(DeleteDatabaseState());
    });
  }
  void createDatabase () {
     openDatabase(
      'TODO.db',
      version : 1,
      onCreate:(database, version ){
        print('database created');
        database.execute('CREATE TABLE TASKS(id INTEGER PRIMARY KEY,title TEXT, date TEXT, time TEXT, status TEXT )').then((value){
          print ('table created');
        }).catchError((error){
          print ('error is ${error.toString()}');
        });
      },
      onOpen: (database){

        print('database opened');
      },
    ).then((value){
      database= value;
      emit(CreateDatabaseState());
     });
  }
   insertToDatabase({
    required String date,
    required String title,
    required String time
  }) async{
     await database!.transaction((txn) async {
      txn.rawInsert('INSERT INTO TASKS(title , date , time) VALUES ("$title", "$date", "$time")')
          .then((value){
        print('$value inserted successfully');
        emit(InsertDatabaseState());

      }).catchError((error){
        print ('Error when inserted ${error.toString()}');
      });
      return null;
    });

  }
  bool isBottomSheetShown= false;
  IconData fabIcon = Icons.edit;
   void ChangeBottomSheetState({
     required bool show,
     required IconData icon,
   })
   {
     isBottomSheetShown= show;
     fabIcon = icon;
     emit(ChangeBottomState());
   }
}



