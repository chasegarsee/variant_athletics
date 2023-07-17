// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExercisesStruct extends FFFirebaseStruct {
  ExercisesStruct({
    String? exerciseId,
    int? sets,
    int? reps,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _exerciseId = exerciseId,
        _sets = sets,
        _reps = reps,
        super(firestoreUtilData);

  // "exerciseId" field.
  String? _exerciseId;
  String get exerciseId => _exerciseId ?? '';
  set exerciseId(String? val) => _exerciseId = val;
  bool hasExerciseId() => _exerciseId != null;

  // "sets" field.
  int? _sets;
  int get sets => _sets ?? 0;
  set sets(int? val) => _sets = val;
  void incrementSets(int amount) => _sets = sets + amount;
  bool hasSets() => _sets != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  set reps(int? val) => _reps = val;
  void incrementReps(int amount) => _reps = reps + amount;
  bool hasReps() => _reps != null;

  static ExercisesStruct fromMap(Map<String, dynamic> data) => ExercisesStruct(
        exerciseId: data['exerciseId'] as String?,
        sets: castToType<int>(data['sets']),
        reps: castToType<int>(data['reps']),
      );

  static ExercisesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ExercisesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'exerciseId': _exerciseId,
        'sets': _sets,
        'reps': _reps,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'exerciseId': serializeParam(
          _exerciseId,
          ParamType.String,
        ),
        'sets': serializeParam(
          _sets,
          ParamType.int,
        ),
        'reps': serializeParam(
          _reps,
          ParamType.int,
        ),
      }.withoutNulls;

  static ExercisesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExercisesStruct(
        exerciseId: deserializeParam(
          data['exerciseId'],
          ParamType.String,
          false,
        ),
        sets: deserializeParam(
          data['sets'],
          ParamType.int,
          false,
        ),
        reps: deserializeParam(
          data['reps'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ExercisesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExercisesStruct &&
        exerciseId == other.exerciseId &&
        sets == other.sets &&
        reps == other.reps;
  }

  @override
  int get hashCode => const ListEquality().hash([exerciseId, sets, reps]);
}

ExercisesStruct createExercisesStruct({
  String? exerciseId,
  int? sets,
  int? reps,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExercisesStruct(
      exerciseId: exerciseId,
      sets: sets,
      reps: reps,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExercisesStruct? updateExercisesStruct(
  ExercisesStruct? exercises, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    exercises
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExercisesStructData(
  Map<String, dynamic> firestoreData,
  ExercisesStruct? exercises,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (exercises == null) {
    return;
  }
  if (exercises.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && exercises.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final exercisesData = getExercisesFirestoreData(exercises, forFieldValue);
  final nestedData = exercisesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = exercises.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExercisesFirestoreData(
  ExercisesStruct? exercises, [
  bool forFieldValue = false,
]) {
  if (exercises == null) {
    return {};
  }
  final firestoreData = mapToFirestore(exercises.toMap());

  // Add any Firestore field values
  exercises.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExercisesListFirestoreData(
  List<ExercisesStruct>? exercisess,
) =>
    exercisess?.map((e) => getExercisesFirestoreData(e, true)).toList() ?? [];
