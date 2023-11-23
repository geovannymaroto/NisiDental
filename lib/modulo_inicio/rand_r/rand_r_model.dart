import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'rand_r_widget.dart' show RandRWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RandRModel extends FlutterFlowModel<RandRWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for TextComent widget.
  FocusNode? textComentFocusNode;
  TextEditingController? textComentController;
  String? Function(BuildContext, String?)? textComentControllerValidator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textComentFocusNode?.dispose();
    textComentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
