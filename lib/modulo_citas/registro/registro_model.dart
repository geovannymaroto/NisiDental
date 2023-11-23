import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'registro_widget.dart' show RegistroWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistroModel extends FlutterFlowModel<RegistroWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for txtemail widget.
  FocusNode? txtemailFocusNode;
  TextEditingController? txtemailController;
  String? Function(BuildContext, String?)? txtemailControllerValidator;
  String? _txtemailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i9iurskc' /* Este campo es obligatorio */,
      );
    }

    return null;
  }

  // State field(s) for txtPass widget.
  FocusNode? txtPassFocusNode;
  TextEditingController? txtPassController;
  late bool txtPassVisibility;
  String? Function(BuildContext, String?)? txtPassControllerValidator;
  String? _txtPassControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd5zwfxae' /* Este campo es obligatorio */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtemailControllerValidator = _txtemailControllerValidator;
    txtPassVisibility = false;
    txtPassControllerValidator = _txtPassControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    txtemailFocusNode?.dispose();
    txtemailController?.dispose();

    txtPassFocusNode?.dispose();
    txtPassController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
