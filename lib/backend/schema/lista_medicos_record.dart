import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListaMedicosRecord extends FirestoreRecord {
  ListaMedicosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombreDoctor" field.
  String? _nombreDoctor;
  String get nombreDoctor => _nombreDoctor ?? '';
  bool hasNombreDoctor() => _nombreDoctor != null;

  void _initializeFields() {
    _nombreDoctor = snapshotData['nombreDoctor'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('listaMedicos');

  static Stream<ListaMedicosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListaMedicosRecord.fromSnapshot(s));

  static Future<ListaMedicosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListaMedicosRecord.fromSnapshot(s));

  static ListaMedicosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ListaMedicosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListaMedicosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListaMedicosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListaMedicosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListaMedicosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListaMedicosRecordData({
  String? nombreDoctor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreDoctor': nombreDoctor,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListaMedicosRecordDocumentEquality
    implements Equality<ListaMedicosRecord> {
  const ListaMedicosRecordDocumentEquality();

  @override
  bool equals(ListaMedicosRecord? e1, ListaMedicosRecord? e2) {
    return e1?.nombreDoctor == e2?.nombreDoctor;
  }

  @override
  int hash(ListaMedicosRecord? e) =>
      const ListEquality().hash([e?.nombreDoctor]);

  @override
  bool isValidKey(Object? o) => o is ListaMedicosRecord;
}
