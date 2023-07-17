import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/bottom_nav/bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProgramModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? workoutId;

  List<ExercisesStruct> exercises = [];
  void addToExercises(ExercisesStruct item) => exercises.add(item);
  void removeFromExercises(ExercisesStruct item) => exercises.remove(item);
  void removeAtIndexFromExercises(int index) => exercises.removeAt(index);
  void updateExercisesAtIndex(int index, Function(ExercisesStruct) updateFn) =>
      exercises[index] = updateFn(exercises[index]);

  List<dynamic> workouts = [];
  void addToWorkouts(dynamic item) => workouts.add(item);
  void removeFromWorkouts(dynamic item) => workouts.remove(item);
  void removeAtIndexFromWorkouts(int index) => workouts.removeAt(index);
  void updateWorkoutsAtIndex(int index, Function(dynamic) updateFn) =>
      workouts[index] = updateFn(workouts[index]);

  int? selectedWorkoutIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in program widget.
  List<WorkoutsRecord>? workout;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
