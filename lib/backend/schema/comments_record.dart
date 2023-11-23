import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "createby" field.
  DocumentReference? _createby;
  DocumentReference? get createby => _createby;
  bool hasCreateby() => _createby != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "createTime" field.
  DateTime? _createTime;
  DateTime? get createTime => _createTime;
  bool hasCreateTime() => _createTime != null;

  // "atcoment" field.
  DocumentReference? _atcoment;
  DocumentReference? get atcoment => _atcoment;
  bool hasAtcoment() => _atcoment != null;

  void _initializeFields() {
    _createby = snapshotData['createby'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _createTime = snapshotData['createTime'] as DateTime?;
    _atcoment = snapshotData['atcoment'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? createby,
  String? comment,
  double? rating,
  DateTime? createTime,
  DocumentReference? atcoment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createby': createby,
      'comment': comment,
      'rating': rating,
      'createTime': createTime,
      'atcoment': atcoment,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.createby == e2?.createby &&
        e1?.comment == e2?.comment &&
        e1?.rating == e2?.rating &&
        e1?.createTime == e2?.createTime &&
        e1?.atcoment == e2?.atcoment;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality()
      .hash([e?.createby, e?.comment, e?.rating, e?.createTime, e?.atcoment]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
