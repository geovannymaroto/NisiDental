import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'registros_materiales_medicos_widget.dart'
    show RegistrosMaterialesMedicosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrosMaterialesMedicosModel
    extends FlutterFlowModel<RegistrosMaterialesMedicosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDownElegir widget.
  String? dropDownElegirValue;
  FormFieldController<String>? dropDownElegirValueController;
  // State field(s) for TextFieldCantidad widget.
  FocusNode? textFieldCantidadFocusNode;
  TextEditingController? textFieldCantidadController;
  String? Function(BuildContext, String?)? textFieldCantidadControllerValidator;
  // State field(s) for DropDownOperacion widget.
  String? dropDownOperacionValue;
  FormFieldController<String>? dropDownOperacionValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldCantidadFocusNode?.dispose();
    textFieldCantidadController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
