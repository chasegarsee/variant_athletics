import '/backend/backend.dart';
import '/components/bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CoachModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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

}
