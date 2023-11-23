import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CitasRecord extends FirestoreRecord {
  CitasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hora" field.
  String? _hora;
  String get hora => _hora ?? '';
  bool hasHora() => _hora != null;

  // "motivoconsulta" field.
  String? _motivoconsulta;
  String get motivoconsulta => _motivoconsulta ?? '';
  bool hasMotivoconsulta() => _motivoconsulta != null;

  // "doctor" field.
  String? _doctor;
  String get doctor => _doctor ?? '';
  bool hasDoctor() => _doctor != null;

  // "fecha" field.
  String? _fecha;
  String get fecha => _fecha ?? '';
  bool hasFecha() => _fecha != null;

  void _initializeFields() {
    _hora = snapshotData['hora'] as String?;
    _motivoconsulta = snapshotData['motivoconsulta'] as String?;
    _doctor = snapshotData['doctor'] as String?;
    _fecha = snapshotData['fecha'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Citas');

  static Stream<CitasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitasRecord.fromSnapshot(s));

  static Future<CitasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitasRecord.fromSnapshot(s));

  static CitasRecord fromSnapshot(DocumentSnapshot snapshot) => CitasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitasRecordData({
  String? hora,
  String? motivoconsulta,
  String? doctor,
  String? fecha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hora': hora,
      'motivoconsulta': motivoconsulta,
      'doctor': doctor,
      'fecha': fecha,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitasRecordDocumentEquality implements Equality<CitasRecord> {
  const CitasRecordDocumentEquality();

  @override
  bool equals(CitasRecord? e1, CitasRecord? e2) {
    return e1?.hora == e2?.hora &&
        e1?.motivoconsulta == e2?.motivoconsulta &&
        e1?.doctor == e2?.doctor &&
        e1?.fecha == e2?.fecha;
  }

  @override
  int hash(CitasRecord? e) => const ListEquality()
      .hash([e?.hora, e?.motivoconsulta, e?.doctor, e?.fecha]);

  @override
  bool isValidKey(Object? o) => o is CitasRecord;
}
