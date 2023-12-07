// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

Future exportarPDF(List<CitasRecord> citasDoc) async {
  final pdf = pw.Document();

  pdf.addPage(pw.MultiPage(
      build: (context) => [
            pw.Header(
                level: 0,
                child: pw.Text('Informacion de Citas',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>['Hora', 'Doctor', 'Motivo'],
              ...citasDoc.map(
                  (Citas) => [Citas.hora, Citas.doctor, Citas.motivoconsulta])
            ])
          ]));

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
