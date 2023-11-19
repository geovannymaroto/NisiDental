import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'agregar_datos_admin_widget.dart' show AgregarDatosAdminWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AgregarDatosAdminModel extends FlutterFlowModel<AgregarDatosAdminWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtNombreMedico widget.
  FocusNode? txtNombreMedicoFocusNode;
  TextEditingController? txtNombreMedicoController;
  String? Function(BuildContext, String?)? txtNombreMedicoControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    txtNombreMedicoFocusNode?.dispose();
    txtNombreMedicoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
