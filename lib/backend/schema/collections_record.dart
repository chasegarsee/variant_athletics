import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CollectionsRecord extends FirestoreRecord {
  CollectionsRecord._(
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

  // "collectionPhotoUrl" field.
  String? _collectionPhotoUrl;
  String get collectionPhotoUrl => _collectionPhotoUrl ?? '';
  bool hasCollectionPhotoUrl() => _collectionPhotoUrl != null;

  void _initializeFields() {
    _coachId = snapshotData['coachId'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _name = snapshotData['name'] as String?;
    _collectionPhotoUrl = snapshotData['collectionPhotoUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('collections');

  static Stream<CollectionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CollectionsRecord.fromSnapshot(s));

  static Future<CollectionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CollectionsRecord.fromSnapshot(s));

  static CollectionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CollectionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CollectionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CollectionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CollectionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CollectionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCollectionsRecordData({
  String? coachId,
  DateTime? createdAt,
  String? description,
  String? name,
  String? collectionPhotoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coachId': coachId,
      'createdAt': createdAt,
      'description': description,
      'name': name,
      'collectionPhotoUrl': collectionPhotoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}
