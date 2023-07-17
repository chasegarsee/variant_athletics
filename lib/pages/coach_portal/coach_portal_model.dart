import '/backend/backend.dart';
import '/components/bottom_nav/bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CoachPortalModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  ProgramsRecord? currentProgram;

  int programIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool firestoreRequestCompleted = false;
  String? firestoreRequestLastUniqueKey;
  // Model for BottomNav component.
  late BottomNavModel bottomNavModel;

  /// Query cache managers for this widget.

  final _currentCoachProgramsManager =
      StreamRequestManager<List<ProgramsRecord>>();
  Stream<List<ProgramsRecord>> currentCoachPrograms({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProgramsRecord>> Function() requestFn,
  }) =>
      _currentCoachProgramsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCurrentCoachProgramsCache() => _currentCoachProgramsManager.clear();
  void clearCurrentCoachProgramsCacheKey(String? uniqueKey) =>
      _currentCoachProgramsManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    bottomNavModel.dispose();

    /// Dispose query cache managers for this widget.

    clearCurrentCoachProgramsCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
