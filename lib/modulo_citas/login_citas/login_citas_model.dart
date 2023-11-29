import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_citas_widget.dart' show LoginCitasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginCitasModel extends FlutterFlowModel<LoginCitasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for txtUser widget.
  FocusNode? txtUserFocusNode;
  TextEditingController? txtUserController;
  String? Function(BuildContext, String?)? txtUserControllerValidator;
  String? _txtUserControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wf2ha32i' /* Este campo es requerido */,
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
        'q7v9ntl8' /* Este campo es requerido */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtUserControllerValidator = _txtUserControllerValidator;
    txtPassVisibility = false;
    txtPassControllerValidator = _txtPassControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    txtUserFocusNode?.dispose();
    txtUserController?.dispose();

    txtPassFocusNode?.dispose();
    txtPassController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
