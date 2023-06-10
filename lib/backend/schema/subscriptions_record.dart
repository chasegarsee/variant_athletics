import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsRecord extends FirestoreRecord {
  SubscriptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "coachId" field.
  String? _coachId;
  String get coachId => _coachId ?? '';
  bool hasCoachId() => _coachId != null;

  // "expirationDate" field.
  DateTime? _expirationDate;
  DateTime? get expirationDate => _expirationDate;
  bool hasExpirationDate() => _expirationDate != null;

  // "subscribedAt" field.
  DateTime? _subscribedAt;
  DateTime? get subscribedAt => _subscribedAt;
  bool hasSubscribedAt() => _subscribedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _coachId = snapshotData['coachId'] as String?;
    _expirationDate = snapshotData['expirationDate'] as DateTime?;
    _subscribedAt = snapshotData['subscribedAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('subscriptions')
          : FirebaseFirestore.instance.collectionGroup('subscriptions');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('subscriptions').doc();

  static Stream<SubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionsRecord.fromSnapshot(s));

  static Future<SubscriptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionsRecord.fromSnapshot(s));

  static SubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionsRecordData({
  String? coachId,
  DateTime? expirationDate,
  DateTime? subscribedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coachId': coachId,
      'expirationDate': expirationDate,
      'subscribedAt': subscribedAt,
    }.withoutNulls,
  );

  return firestoreData;
}
