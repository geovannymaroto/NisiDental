import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegistroMaterialRecord extends FirestoreRecord {
  RegistroMaterialRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Material" field.
  DocumentReference? _material;
  DocumentReference? get material => _material;
  bool hasMaterial() => _material != null;

  // "Cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "EntregaMaterial" field.
  String? _entregaMaterial;
  String get entregaMaterial => _entregaMaterial ?? '';
  bool hasEntregaMaterial() => _entregaMaterial != null;

  // "RecibeMaterial" field.
  String? _recibeMaterial;
  String get recibeMaterial => _recibeMaterial ?? '';
  bool hasRecibeMaterial() => _recibeMaterial != null;

  // "creado" field.
  DateTime? _creado;
  DateTime? get creado => _creado;
  bool hasCreado() => _creado != null;

  // "tipoOperacion" field.
  String? _tipoOperacion;
  String get tipoOperacion => _tipoOperacion ?? '';
  bool hasTipoOperacion() => _tipoOperacion != null;

  void _initializeFields() {
    _material = snapshotData['Material'] as DocumentReference?;
    _cantidad = castToType<int>(snapshotData['Cantidad']);
    _entregaMaterial = snapshotData['EntregaMaterial'] as String?;
    _recibeMaterial = snapshotData['RecibeMaterial'] as String?;
    _creado = snapshotData['creado'] as DateTime?;
    _tipoOperacion = snapshotData['tipoOperacion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('registroMaterial');

  static Stream<RegistroMaterialRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegistroMaterialRecord.fromSnapshot(s));

  static Future<RegistroMaterialRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RegistroMaterialRecord.fromSnapshot(s));

  static RegistroMaterialRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegistroMaterialRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegistroMaterialRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegistroMaterialRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegistroMaterialRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegistroMaterialRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegistroMaterialRecordData({
  DocumentReference? material,
  int? cantidad,
  String? entregaMaterial,
  String? recibeMaterial,
  DateTime? creado,
  String? tipoOperacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Material': material,
      'Cantidad': cantidad,
      'EntregaMaterial': entregaMaterial,
      'RecibeMaterial': recibeMaterial,
      'creado': creado,
      'tipoOperacion': tipoOperacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegistroMaterialRecordDocumentEquality
    implements Equality<RegistroMaterialRecord> {
  const RegistroMaterialRecordDocumentEquality();

  @override
  bool equals(RegistroMaterialRecord? e1, RegistroMaterialRecord? e2) {
    return e1?.material == e2?.material &&
        e1?.cantidad == e2?.cantidad &&
        e1?.entregaMaterial == e2?.entregaMaterial &&
        e1?.recibeMaterial == e2?.recibeMaterial &&
        e1?.creado == e2?.creado &&
        e1?.tipoOperacion == e2?.tipoOperacion;
  }

  @override
  int hash(RegistroMaterialRecord? e) => const ListEquality().hash([
        e?.material,
        e?.cantidad,
        e?.entregaMaterial,
        e?.recibeMaterial,
        e?.creado,
        e?.tipoOperacion
      ]);

  @override
  bool isValidKey(Object? o) => o is RegistroMaterialRecord;
}
