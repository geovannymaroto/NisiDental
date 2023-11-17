import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegistrarMaterialRecord extends FirestoreRecord {
  RegistrarMaterialRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "material" field.
  DocumentReference? _material;
  DocumentReference? get material => _material;
  bool hasMaterial() => _material != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "entregaMaterial" field.
  String? _entregaMaterial;
  String get entregaMaterial => _entregaMaterial ?? '';
  bool hasEntregaMaterial() => _entregaMaterial != null;

  // "recibeMaterial" field.
  String? _recibeMaterial;
  String get recibeMaterial => _recibeMaterial ?? '';
  bool hasRecibeMaterial() => _recibeMaterial != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _material = snapshotData['material'] as DocumentReference?;
    _cantidad = castToType<int>(snapshotData['cantidad']);
    _entregaMaterial = snapshotData['entregaMaterial'] as String?;
    _recibeMaterial = snapshotData['recibeMaterial'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('registrarMaterial')
          : FirebaseFirestore.instance.collectionGroup('registrarMaterial');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('registrarMaterial').doc();

  static Stream<RegistrarMaterialRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegistrarMaterialRecord.fromSnapshot(s));

  static Future<RegistrarMaterialRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RegistrarMaterialRecord.fromSnapshot(s));

  static RegistrarMaterialRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegistrarMaterialRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegistrarMaterialRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegistrarMaterialRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegistrarMaterialRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegistrarMaterialRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegistrarMaterialRecordData({
  DocumentReference? material,
  int? cantidad,
  String? entregaMaterial,
  String? recibeMaterial,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'material': material,
      'cantidad': cantidad,
      'entregaMaterial': entregaMaterial,
      'recibeMaterial': recibeMaterial,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegistrarMaterialRecordDocumentEquality
    implements Equality<RegistrarMaterialRecord> {
  const RegistrarMaterialRecordDocumentEquality();

  @override
  bool equals(RegistrarMaterialRecord? e1, RegistrarMaterialRecord? e2) {
    return e1?.material == e2?.material &&
        e1?.cantidad == e2?.cantidad &&
        e1?.entregaMaterial == e2?.entregaMaterial &&
        e1?.recibeMaterial == e2?.recibeMaterial;
  }

  @override
  int hash(RegistrarMaterialRecord? e) => const ListEquality()
      .hash([e?.material, e?.cantidad, e?.entregaMaterial, e?.recibeMaterial]);

  @override
  bool isValidKey(Object? o) => o is RegistrarMaterialRecord;
}
