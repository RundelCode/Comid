import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class NegociosRecord extends FirestoreRecord {
  NegociosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "latlon" field.
  LatLng? _latlon;
  LatLng? get latlon => _latlon;
  bool hasLatlon() => _latlon != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "autenticado" field.
  bool? _autenticado;
  bool get autenticado => _autenticado ?? false;
  bool hasAutenticado() => _autenticado != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _id = snapshotData['id'] as String?;
    _direccion = snapshotData['direccion'] as String?;
    _latlon = snapshotData['latlon'] as LatLng?;
    _descripcion = snapshotData['descripcion'] as String?;
    _ciudad = snapshotData['ciudad'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _autenticado = snapshotData['autenticado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('negocios');

  static Stream<NegociosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NegociosRecord.fromSnapshot(s));

  static Future<NegociosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NegociosRecord.fromSnapshot(s));

  static NegociosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NegociosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NegociosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NegociosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NegociosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NegociosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNegociosRecordData({
  String? name,
  DocumentReference? owner,
  String? image,
  String? id,
  String? direccion,
  LatLng? latlon,
  String? descripcion,
  String? ciudad,
  String? tipo,
  bool? autenticado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'owner': owner,
      'image': image,
      'id': id,
      'direccion': direccion,
      'latlon': latlon,
      'descripcion': descripcion,
      'ciudad': ciudad,
      'tipo': tipo,
      'autenticado': autenticado,
    }.withoutNulls,
  );

  return firestoreData;
}

class NegociosRecordDocumentEquality implements Equality<NegociosRecord> {
  const NegociosRecordDocumentEquality();

  @override
  bool equals(NegociosRecord? e1, NegociosRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.owner == e2?.owner &&
        e1?.image == e2?.image &&
        e1?.id == e2?.id &&
        e1?.direccion == e2?.direccion &&
        e1?.latlon == e2?.latlon &&
        e1?.descripcion == e2?.descripcion &&
        e1?.ciudad == e2?.ciudad &&
        e1?.tipo == e2?.tipo &&
        e1?.autenticado == e2?.autenticado;
  }

  @override
  int hash(NegociosRecord? e) => const ListEquality().hash([
        e?.name,
        e?.owner,
        e?.image,
        e?.id,
        e?.direccion,
        e?.latlon,
        e?.descripcion,
        e?.ciudad,
        e?.tipo,
        e?.autenticado
      ]);

  @override
  bool isValidKey(Object? o) => o is NegociosRecord;
}
