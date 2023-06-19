import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExercisesRecord extends FirestoreRecord {
  ExercisesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "coachId" field.
  String? _coachId;
  String get coachId => _coachId ?? '';
  bool hasCoachId() => _coachId != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "videoId" field.
  String? _videoId;
  String get videoId => _videoId ?? '';
  bool hasVideoId() => _videoId != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "workoutId" field.
  String? _workoutId;
  String get workoutId => _workoutId ?? '';
  bool hasWorkoutId() => _workoutId != null;

  void _initializeFields() {
    _coachId = snapshotData['coachId'] as String?;
    _details = snapshotData['details'] as String?;
    _name = snapshotData['name'] as String?;
    _videoId = snapshotData['videoId'] as String?;
    _videoUrl = snapshotData['videoUrl'] as String?;
    _workoutId = snapshotData['workoutId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exercises');

  static Stream<ExercisesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExercisesRecord.fromSnapshot(s));

  static Future<ExercisesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExercisesRecord.fromSnapshot(s));

  static ExercisesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExercisesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExercisesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExercisesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExercisesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExercisesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExercisesRecordData({
  String? coachId,
  String? details,
  String? name,
  String? videoId,
  String? videoUrl,
  String? workoutId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coachId': coachId,
      'details': details,
      'name': name,
      'videoId': videoId,
      'videoUrl': videoUrl,
      'workoutId': workoutId,
    }.withoutNulls,
  );

  return firestoreData;
}
