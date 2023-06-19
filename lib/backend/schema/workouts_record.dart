import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutsRecord extends FirestoreRecord {
  WorkoutsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "programId" field.
  String? _programId;
  String get programId => _programId ?? '';
  bool hasProgramId() => _programId != null;

  // "exercises" field.
  List<String>? _exercises;
  List<String> get exercises => _exercises ?? const [];
  bool hasExercises() => _exercises != null;

  // "coachUid" field.
  String? _coachUid;
  String get coachUid => _coachUid ?? '';
  bool hasCoachUid() => _coachUid != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _name = snapshotData['name'] as String?;
    _programId = snapshotData['programId'] as String?;
    _exercises = getDataList(snapshotData['exercises']);
    _coachUid = snapshotData['coachUid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workouts');

  static Stream<WorkoutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkoutsRecord.fromSnapshot(s));

  static Future<WorkoutsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkoutsRecord.fromSnapshot(s));

  static WorkoutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkoutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkoutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkoutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkoutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkoutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkoutsRecordData({
  String? description,
  String? name,
  String? programId,
  String? coachUid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'name': name,
      'programId': programId,
      'coachUid': coachUid,
    }.withoutNulls,
  );

  return firestoreData;
}
