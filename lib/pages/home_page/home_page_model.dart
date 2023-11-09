import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtUser widget.
  FocusNode? txtUserFocusNode;
  TextEditingController? txtUserController;
  String? Function(BuildContext, String?)? txtUserControllerValidator;
  // State field(s) for txtPass widget.
  FocusNode? txtPassFocusNode;
  TextEditingController? txtPassController;
  late bool txtPassVisibility;
  String? Function(BuildContext, String?)? txtPassControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtPassVisibility = false;
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
