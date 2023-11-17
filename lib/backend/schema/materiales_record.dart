import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaterialesRecord extends FirestoreRecord {
  MaterialesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _imagen = snapshotData['imagen'] as String?;
    _cantidad = castToType<int>(snapshotData['cantidad']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('materiales');

  static Stream<MaterialesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaterialesRecord.fromSnapshot(s));

  static Future<MaterialesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MaterialesRecord.fromSnapshot(s));

  static MaterialesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaterialesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaterialesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaterialesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaterialesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaterialesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaterialesRecordData({
  String? nombre,
  String? imagen,
  int? cantidad,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'imagen': imagen,
      'cantidad': cantidad,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaterialesRecordDocumentEquality implements Equality<MaterialesRecord> {
  const MaterialesRecordDocumentEquality();

  @override
  bool equals(MaterialesRecord? e1, MaterialesRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.imagen == e2?.imagen &&
        e1?.cantidad == e2?.cantidad;
  }

  @override
  int hash(MaterialesRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.imagen, e?.cantidad]);

  @override
  bool isValidKey(Object? o) => o is MaterialesRecord;
}
