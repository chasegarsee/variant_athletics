import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoachesRecord extends FirestoreRecord {
  CoachesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bannerUrl" field.
  String? _bannerUrl;
  String get bannerUrl => _bannerUrl ?? '';
  bool hasBannerUrl() => _bannerUrl != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "profilePhotoUrl" field.
  String? _profilePhotoUrl;
  String get profilePhotoUrl => _profilePhotoUrl ?? '';
  bool hasProfilePhotoUrl() => _profilePhotoUrl != null;

  // "revenueShare" field.
  int? _revenueShare;
  int get revenueShare => _revenueShare ?? 0;
  bool hasRevenueShare() => _revenueShare != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _bannerUrl = snapshotData['bannerUrl'] as String?;
    _email = snapshotData['email'] as String?;
    _name = snapshotData['name'] as String?;
    _profilePhotoUrl = snapshotData['profilePhotoUrl'] as String?;
    _revenueShare = snapshotData['revenueShare'] as int?;
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coaches');

  static Stream<CoachesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoachesRecord.fromSnapshot(s));

  static Future<CoachesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoachesRecord.fromSnapshot(s));

  static CoachesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoachesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoachesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoachesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoachesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoachesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoachesRecordData({
  String? bannerUrl,
  String? email,
  String? name,
  String? profilePhotoUrl,
  int? revenueShare,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bannerUrl': bannerUrl,
      'email': email,
      'name': name,
      'profilePhotoUrl': profilePhotoUrl,
      'revenueShare': revenueShare,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}
