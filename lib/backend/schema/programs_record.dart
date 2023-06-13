import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramsRecord extends FirestoreRecord {
  ProgramsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "coachId" field.
  String? _coachId;
  String get coachId => _coachId ?? '';
  bool hasCoachId() => _coachId != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "programPhotoUrl" field.
  String? _programPhotoUrl;
  String get programPhotoUrl => _programPhotoUrl ?? '';
  bool hasProgramPhotoUrl() => _programPhotoUrl != null;

  void _initializeFields() {
    _coachId = snapshotData['coachId'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _name = snapshotData['name'] as String?;
    _programPhotoUrl = snapshotData['programPhotoUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('programs');

  static Stream<ProgramsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgramsRecord.fromSnapshot(s));

  static Future<ProgramsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgramsRecord.fromSnapshot(s));

  static ProgramsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgramsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgramsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgramsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgramsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgramsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgramsRecordData({
  String? coachId,
  DateTime? createdAt,
  String? description,
  String? name,
  String? programPhotoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coachId': coachId,
      'createdAt': createdAt,
      'description': description,
      'name': name,
      'programPhotoUrl': programPhotoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}
