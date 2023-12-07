import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HoraCitasRecord extends FirestoreRecord {
  HoraCitasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hora" field.
  String? _hora;
  String get hora => _hora ?? '';
  bool hasHora() => _hora != null;

  void _initializeFields() {
    _hora = snapshotData['hora'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('horaCitas');

  static Stream<HoraCitasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HoraCitasRecord.fromSnapshot(s));

  static Future<HoraCitasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HoraCitasRecord.fromSnapshot(s));

  static HoraCitasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HoraCitasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HoraCitasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HoraCitasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HoraCitasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HoraCitasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHoraCitasRecordData({
  String? hora,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hora': hora,
    }.withoutNulls,
  );

  return firestoreData;
}

class HoraCitasRecordDocumentEquality implements Equality<HoraCitasRecord> {
  const HoraCitasRecordDocumentEquality();

  @override
  bool equals(HoraCitasRecord? e1, HoraCitasRecord? e2) {
    return e1?.hora == e2?.hora;
  }

  @override
  int hash(HoraCitasRecord? e) => const ListEquality().hash([e?.hora]);

  @override
  bool isValidKey(Object? o) => o is HoraCitasRecord;
}
