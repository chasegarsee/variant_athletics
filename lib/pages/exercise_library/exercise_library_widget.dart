import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_nav/bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'exercise_library_model.dart';
export 'exercise_library_model.dart';

class ExerciseLibraryWidget extends StatefulWidget {
  const ExerciseLibraryWidget({Key? key}) : super(key: key);

  @override
  _ExerciseLibraryWidgetState createState() => _ExerciseLibraryWidgetState();
}

class _ExerciseLibraryWidgetState extends State<ExerciseLibraryWidget> {
  late ExerciseLibraryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExerciseLibraryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.exerciseList = await queryExercisesRecordOnce();
      FFAppState().update(() {
        FFAppState().exercises = functions
            .convertFBExerciseToJSON(_model.exerciseList?.toList())!
            .toList()
            .cast<dynamic>();
      });
      setState(() {
        _model.filteredExercises =
            FFAppState().exercises.toList().cast<dynamic>();
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).secondary),
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(
                        _model.dropDownValue ??=
                            FFLocalizations.of(context).getText(
                          'llia7ft4' /* All Exercises */,
                        ),
                      ),
                      options: [
                        FFLocalizations.of(context).getText(
                          'aoqbyovd' /* All Exercises */,
                        ),
                        FFLocalizations.of(context).getText(
                          'on062eel' /* Abs */,
                        ),
                        FFLocalizations.of(context).getText(
                          '5eiicejk' /* Back */,
                        ),
                        FFLocalizations.of(context).getText(
                          'z7qlqwso' /* Calves */,
                        ),
                        FFLocalizations.of(context).getText(
                          'hq6833yj' /* Chest */,
                        ),
                        FFLocalizations.of(context).getText(
                          'in8bvc0x' /* Forearms */,
                        ),
                        FFLocalizations.of(context).getText(
                          'dq48mgdx' /* Glutes */,
                        ),
                        FFLocalizations.of(context).getText(
                          'k99mqzc8' /* Hamstrings */,
                        ),
                        FFLocalizations.of(context).getText(
                          'evzbqcde' /* Lower Back */,
                        ),
                        FFLocalizations.of(context).getText(
                          'z2dq2zrb' /* Quads */,
                        ),
                        FFLocalizations.of(context).getText(
                          'jbolmqu3' /* Shoulders */,
                        ),
                        FFLocalizations.of(context).getText(
                          'txl16uw6' /* Traps */,
                        ),
                        FFLocalizations.of(context).getText(
                          'vk8usew7' /* Triceps */,
                        )
                      ],
                      onChanged: (val) async {
                        setState(() => _model.dropDownValue = val);
                        if (_model.dropDownValue == 'All Exercises') {
                          setState(() {
                            _model.filteredExercises =
                                FFAppState().exercises.toList().cast<dynamic>();
                          });
                        } else {
                          setState(() {
                            _model.filteredExercises = functions
                                .filterJson('tag', _model.dropDownValue,
                                    FFAppState().exercises.toList())!
                                .toList()
                                .cast<dynamic>();
                          });
                        }
                      },
                      width: 300.0,
                      height: 50.0,
                      searchHintTextStyle:
                          FlutterFlowTheme.of(context).labelMedium,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                      hintText: FFLocalizations.of(context).getText(
                        '4t2ha51o' /* Please select... */,
                      ),
                      searchHintText: FFLocalizations.of(context).getText(
                        'iy2fkfow' /* Search for an item... */,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: true,
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final filteredExercise =
                            _model.filteredExercises.toList();
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                            childAspectRatio: 1.0,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: filteredExercise.length,
                          itemBuilder: (context, filteredExerciseIndex) {
                            final filteredExerciseItem =
                                filteredExercise[filteredExerciseIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 5.0),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://picsum.photos/seed/993/600',
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.81, 0.55),
                                    child: Text(
                                      getJsonField(
                                        filteredExerciseItem,
                                        r'''$.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.8, 0.88),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 90.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  filteredExerciseItem,
                                                  r'''$.tag''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.bottomNavModel,
                  updateCallback: () => setState(() {}),
                  child: BottomNavWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
