import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'historial_model.dart';
export 'historial_model.dart';

class HistorialWidget extends StatefulWidget {
  const HistorialWidget({Key? key}) : super(key: key);

  @override
  _HistorialWidgetState createState() => _HistorialWidgetState();
}

class _HistorialWidgetState extends State<HistorialWidget> {
  late HistorialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistorialModel());
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
        appBar: AppBar(
          backgroundColor: Color(0xFF2EC4B6),
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'urgaog64' /* Historial */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                  child: StreamBuilder<List<CitasRecord>>(
                    stream: queryCitasRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<CitasRecord> dataTableCitasRecordList =
                          snapshot.data!;
                      return DataTable2(
                        columns: [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '8nwq7nuz' /* Fecha */,
                                ),
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'p3p3b8r9' /* Motivo */,
                                ),
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                          ),
                        ],
                        rows: dataTableCitasRecordList
                            .mapIndexed(
                                (dataTableIndex, dataTableCitasRecord) => [
                                      Text(
                                        dateTimeFormat(
                                          'yMMMd',
                                          dataTableCitasRecord.fecha!,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        dataTableCitasRecord.motivoconsulta,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ].map((c) => DataCell(c)).toList())
                            .map((e) => DataRow(cells: e))
                            .toList(),
                        headingRowColor: MaterialStateProperty.all(
                          FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        headingRowHeight: 56.0,
                        dataRowColor: MaterialStateProperty.all(
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        dataRowHeight: 56.0,
                        border: TableBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        dividerThickness: 1.0,
                        showBottomBorder: true,
                        minWidth: 49.0,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 250.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('Inicio');
                      },
                      text: FFLocalizations.of(context).getText(
                        'uq9iotr8' /* Volver
 */
                        ,
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF2EC4B6),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
