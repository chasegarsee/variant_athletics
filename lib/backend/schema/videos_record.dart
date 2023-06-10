import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "coachId" field.
  String? _coachId;
  String get coachId => _coachId ?? '';
  bool hasCoachId() => _coachId != null;

  // "collectionId" field.
  String? _collectionId;
  String get collectionId => _collectionId ?? '';
  bool hasCollectionId() => _collectionId != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

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
    _collectionId = snapshotData['collectionId'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _videoUrl = snapshotData['videoUrl'] as String?;
    _workoutId = snapshotData['workoutId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  String? coachId,
  String? collectionId,
  DateTime? createdAt,
  String? videoUrl,
  String? workoutId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coachId': coachId,
      'collectionId': collectionId,
      'createdAt': createdAt,
      'videoUrl': videoUrl,
      'workoutId': workoutId,
    }.withoutNulls,
  );

  return firestoreData;
}
