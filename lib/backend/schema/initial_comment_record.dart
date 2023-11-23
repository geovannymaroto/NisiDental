import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InitialCommentRecord extends FirestoreRecord {
  InitialCommentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comlist" field.
  List<DocumentReference>? _comlist;
  List<DocumentReference> get comlist => _comlist ?? const [];
  bool hasComlist() => _comlist != null;

  void _initializeFields() {
    _comlist = getDataList(snapshotData['comlist']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('InitialComment');

  static Stream<InitialCommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InitialCommentRecord.fromSnapshot(s));

  static Future<InitialCommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InitialCommentRecord.fromSnapshot(s));

  static InitialCommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InitialCommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InitialCommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InitialCommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InitialCommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InitialCommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInitialCommentRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class InitialCommentRecordDocumentEquality
    implements Equality<InitialCommentRecord> {
  const InitialCommentRecordDocumentEquality();

  @override
  bool equals(InitialCommentRecord? e1, InitialCommentRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.comlist, e2?.comlist);
  }

  @override
  int hash(InitialCommentRecord? e) => const ListEquality().hash([e?.comlist]);

  @override
  bool isValidKey(Object? o) => o is InitialCommentRecord;
}
