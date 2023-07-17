// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    String? coachUid,
    DateTime? createdTime,
    String? displayName,
    String? email,
    bool? isCoach,
    String? uid,
    List<String>? completedWorkouts,
    String? favoriteCoach,
    String? currentProgramId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _coachUid = coachUid,
        _createdTime = createdTime,
        _displayName = displayName,
        _email = email,
        _isCoach = isCoach,
        _uid = uid,
        _completedWorkouts = completedWorkouts,
        _favoriteCoach = favoriteCoach,
        _currentProgramId = currentProgramId,
        super(firestoreUtilData);

  // "coachUid" field.
  String? _coachUid;
  String get coachUid => _coachUid ?? '';
  set coachUid(String? val) => _coachUid = val;
  bool hasCoachUid() => _coachUid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "isCoach" field.
  bool? _isCoach;
  bool get isCoach => _isCoach ?? false;
  set isCoach(bool? val) => _isCoach = val;
  bool hasIsCoach() => _isCoach != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "completedWorkouts" field.
  List<String>? _completedWorkouts;
  List<String> get completedWorkouts => _completedWorkouts ?? const [];
  set completedWorkouts(List<String>? val) => _completedWorkouts = val;
  void updateCompletedWorkouts(Function(List<String>) updateFn) =>
      updateFn(_completedWorkouts ??= []);
  bool hasCompletedWorkouts() => _completedWorkouts != null;

  // "favoriteCoach" field.
  String? _favoriteCoach;
  String get favoriteCoach => _favoriteCoach ?? '';
  set favoriteCoach(String? val) => _favoriteCoach = val;
  bool hasFavoriteCoach() => _favoriteCoach != null;

  // "currentProgramId" field.
  String? _currentProgramId;
  String get currentProgramId => _currentProgramId ?? '';
  set currentProgramId(String? val) => _currentProgramId = val;
  bool hasCurrentProgramId() => _currentProgramId != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        coachUid: data['coachUid'] as String?,
        createdTime: data['created_time'] as DateTime?,
        displayName: data['display_name'] as String?,
        email: data['email'] as String?,
        isCoach: data['isCoach'] as bool?,
        uid: data['uid'] as String?,
        completedWorkouts: getDataList(data['completedWorkouts']),
        favoriteCoach: data['favoriteCoach'] as String?,
        currentProgramId: data['currentProgramId'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'coachUid': _coachUid,
        'created_time': _createdTime,
        'display_name': _displayName,
        'email': _email,
        'isCoach': _isCoach,
        'uid': _uid,
        'completedWorkouts': _completedWorkouts,
        'favoriteCoach': _favoriteCoach,
        'currentProgramId': _currentProgramId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'coachUid': serializeParam(
          _coachUid,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'isCoach': serializeParam(
          _isCoach,
          ParamType.bool,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'completedWorkouts': serializeParam(
          _completedWorkouts,
          ParamType.String,
          true,
        ),
        'favoriteCoach': serializeParam(
          _favoriteCoach,
          ParamType.String,
        ),
        'currentProgramId': serializeParam(
          _currentProgramId,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        coachUid: deserializeParam(
          data['coachUid'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        isCoach: deserializeParam(
          data['isCoach'],
          ParamType.bool,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        completedWorkouts: deserializeParam<String>(
          data['completedWorkouts'],
          ParamType.String,
          true,
        ),
        favoriteCoach: deserializeParam(
          data['favoriteCoach'],
          ParamType.String,
          false,
        ),
        currentProgramId: deserializeParam(
          data['currentProgramId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        coachUid == other.coachUid &&
        createdTime == other.createdTime &&
        displayName == other.displayName &&
        email == other.email &&
        isCoach == other.isCoach &&
        uid == other.uid &&
        listEquality.equals(completedWorkouts, other.completedWorkouts) &&
        favoriteCoach == other.favoriteCoach &&
        currentProgramId == other.currentProgramId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        coachUid,
        createdTime,
        displayName,
        email,
        isCoach,
        uid,
        completedWorkouts,
        favoriteCoach,
        currentProgramId
      ]);
}

UserStruct createUserStruct({
  String? coachUid,
  DateTime? createdTime,
  String? displayName,
  String? email,
  bool? isCoach,
  String? uid,
  String? favoriteCoach,
  String? currentProgramId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      coachUid: coachUid,
      createdTime: createdTime,
      displayName: displayName,
      email: email,
      isCoach: isCoach,
      uid: uid,
      favoriteCoach: favoriteCoach,
      currentProgramId: currentProgramId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && user.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = user.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
