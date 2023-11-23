import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rand_r_model.dart';
export 'rand_r_model.dart';

class RandRWidget extends StatefulWidget {
  const RandRWidget({Key? key}) : super(key: key);

  @override
  _RandRWidgetState createState() => _RandRWidgetState();
}

class _RandRWidgetState extends State<RandRWidget> {
  late RandRModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RandRModel());

    _model.textComentController ??= TextEditingController();
    _model.textComentFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 30.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '4bumesn7' /* Rating & Review */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'cx9alid7' /* Evalúe y comente su experienci... */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 10.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'skbvle98' /* Tómese un momento para evaluar... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 40.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          onRatingUpdate: (newValue) =>
                              setState(() => _model.ratingBarValue1 = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFBF69),
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBarValue1 ??= 3.0,
                          unratedColor: FlutterFlowTheme.of(context).accent3,
                          itemCount: 5,
                          itemSize: 50.0,
                          glowColor: Color(0xFFFFBF69),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: TextFormField(
                    controller: _model.textComentController,
                    focusNode: _model.textComentFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        '2uauowue' /* Escriba su opinión */,
                      ),
                      hintText: FFLocalizations.of(context).getText(
                        'omhp1s1s' /* cuentanos tu experiencia */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFFBF69),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator: _model.textComentControllerValidator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 16.0, 15.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await CommentsRecord.collection
                          .doc()
                          .set(createCommentsRecordData(
                            comment: _model.textComentController.text,
                            createby: currentUserReference,
                            createTime: getCurrentTimestamp,
                            rating: _model.ratingBarValue1,
                          ));
                    },
                    text: FFLocalizations.of(context).getText(
                      'i5wtpzs4' /* enviar */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 55.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF2EC4B6),
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    width: 433.0,
                    height: 463.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 30.0, 0.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/user.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 20.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'zjswz5i7' /* Usuario */,
                                    ),
                                    textAlign: TextAlign.justify,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Icon(
                                    Icons.access_time,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '848ah0pr' /* Md */,
                                  ),
                                  textAlign: TextAlign.end,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: RatingBar.builder(
                                    onRatingUpdate: (newValue) => setState(() =>
                                        _model.ratingBarValue2 = newValue),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                    direction: Axis.horizontal,
                                    initialRating: _model.ratingBarValue2 ??=
                                        0.0,
                                    unratedColor:
                                        FlutterFlowTheme.of(context).accent3,
                                    itemCount: 5,
                                    itemSize: 27.0,
                                    glowColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 20.0, 24.0, 0.0),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFCBF3F0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0xFF2EC4B6),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'amhxe78r' /* comentario */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
