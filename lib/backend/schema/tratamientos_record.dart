import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TratamientosRecord extends FirestoreRecord {
  TratamientosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tratamientos" field.
  String? _tratamientos;
  String get tratamientos => _tratamientos ?? '';
  bool hasTratamientos() => _tratamientos != null;

  void _initializeFields() {
    _tratamientos = snapshotData['tratamientos'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tratamientos');

  static Stream<TratamientosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TratamientosRecord.fromSnapshot(s));

  static Future<TratamientosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TratamientosRecord.fromSnapshot(s));

  static TratamientosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TratamientosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TratamientosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TratamientosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TratamientosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TratamientosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTratamientosRecordData({
  String? tratamientos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tratamientos': tratamientos,
    }.withoutNulls,
  );

  return firestoreData;
}

class TratamientosRecordDocumentEquality
    implements Equality<TratamientosRecord> {
  const TratamientosRecordDocumentEquality();

  @override
  bool equals(TratamientosRecord? e1, TratamientosRecord? e2) {
    return e1?.tratamientos == e2?.tratamientos;
  }

  @override
  int hash(TratamientosRecord? e) =>
      const ListEquality().hash([e?.tratamientos]);

  @override
  bool isValidKey(Object? o) => o is TratamientosRecord;
}
