import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isPortal = prefs.getString('ff_isPortal') ?? _isPortal;
    });
    _safeInit(() {
      _isPortalBool = prefs.getBool('ff_isPortalBool') ?? _isPortalBool;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _isPortal = 'false';
  String get isPortal => _isPortal;
  set isPortal(String _value) {
    _isPortal = _value;
    prefs.setString('ff_isPortal', _value);
  }

  bool _isPortalBool = false;
  bool get isPortalBool => _isPortalBool;
  set isPortalBool(bool _value) {
    _isPortalBool = _value;
    prefs.setBool('ff_isPortalBool', _value);
  }

  final _currentUserManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> currentUser({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _currentUserManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCurrentUserCache() => _currentUserManager.clear();
  void clearCurrentUserCacheKey(String? uniqueKey) =>
      _currentUserManager.clearRequest(uniqueKey);

  final _favoriteCoachManager = StreamRequestManager<List<CoachesRecord>>();
  Stream<List<CoachesRecord>> favoriteCoach({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CoachesRecord>> Function() requestFn,
  }) =>
      _favoriteCoachManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFavoriteCoachCache() => _favoriteCoachManager.clear();
  void clearFavoriteCoachCacheKey(String? uniqueKey) =>
      _favoriteCoachManager.clearRequest(uniqueKey);

  final _featuredCoachesManager = StreamRequestManager<List<CoachesRecord>>();
  Stream<List<CoachesRecord>> featuredCoaches({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CoachesRecord>> Function() requestFn,
  }) =>
      _featuredCoachesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFeaturedCoachesCache() => _featuredCoachesManager.clear();
  void clearFeaturedCoachesCacheKey(String? uniqueKey) =>
      _featuredCoachesManager.clearRequest(uniqueKey);

  final _authenticatedCoachWorkoutsManager =
      FutureRequestManager<List<WorkoutsRecord>>();
  Future<List<WorkoutsRecord>> authenticatedCoachWorkouts({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<WorkoutsRecord>> Function() requestFn,
  }) =>
      _authenticatedCoachWorkoutsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAuthenticatedCoachWorkoutsCache() =>
      _authenticatedCoachWorkoutsManager.clear();
  void clearAuthenticatedCoachWorkoutsCacheKey(String? uniqueKey) =>
      _authenticatedCoachWorkoutsManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
