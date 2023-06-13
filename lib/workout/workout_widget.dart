import '/backend/backend.dart';
import '/components/bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workout_model.dart';
export 'workout_model.dart';

class WorkoutWidget extends StatefulWidget {
  const WorkoutWidget({
    Key? key,
    required this.workoutRef,
    required this.programRef,
  }) : super(key: key);

  final DocumentReference? workoutRef;
  final DocumentReference? programRef;

  @override
  _WorkoutWidgetState createState() => _WorkoutWidgetState();
}

class _WorkoutWidgetState extends State<WorkoutWidget> {
  late WorkoutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<WorkoutsRecord>>(
      stream: queryWorkoutsRecord(
        queryBuilder: (workoutsRecord) =>
            workoutsRecord.where('programId', isEqualTo: widget.programRef?.id),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitWanderingCubes(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<WorkoutsRecord> workoutWorkoutsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final workoutWorkoutsRecord = workoutWorkoutsRecordList.isNotEmpty
            ? workoutWorkoutsRecordList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                iconTheme: IconThemeData(
                    color: FlutterFlowTheme.of(context).primaryText),
                automaticallyImplyLeading: true,
                title: Text(
                  'Page Title',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Jost',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 22.0,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.95,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: StreamBuilder<List<MovementsRecord>>(
                          stream: queryMovementsRecord(
                            queryBuilder: (movementsRecord) =>
                                movementsRecord.where('workoutId',
                                    isEqualTo: widget.workoutRef?.id),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitWanderingCubes(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<MovementsRecord> pageViewMovementsRecordList =
                                snapshot.data!;
                            return Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 1.0,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 40.0),
                                child: PageView.builder(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: min(
                                              0,
                                              pageViewMovementsRecordList
                                                      .length -
                                                  1)),
                                  scrollDirection: Axis.vertical,
                                  itemCount: pageViewMovementsRecordList.length,
                                  itemBuilder: (context, pageViewIndex) {
                                    final pageViewMovementsRecord =
                                        pageViewMovementsRecordList[
                                            pageViewIndex];
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1.0,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: FlutterFlowVideoPlayer(
                                              path: pageViewMovementsRecord
                                                  .videoUrl,
                                              videoType: VideoType.network,
                                              width: double.infinity,
                                              autoPlay: true,
                                              looping: false,
                                              showControls: false,
                                              allowFullScreen: true,
                                              allowPlaybackSpeedMenu: false,
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      1.0,
                                                  height: 785.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00EE8B60),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x91000000),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: Text(
                                                              pageViewMovementsRecord
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Jost',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize:
                                                                        42.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -0.74),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          25.0,
                                                                          25.0,
                                                                          25.0,
                                                                          25.0),
                                                              child: Text(
                                                                pageViewMovementsRecord
                                                                    .details,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Jost',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  wrapWithModel(
                    model: _model.bottomNavModel,
                    updateCallback: () => setState(() {}),
                    child: BottomNavWidget(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
