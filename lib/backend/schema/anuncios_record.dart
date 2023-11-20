import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AnunciosRecord extends FirestoreRecord {
  AnunciosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "autenticado" field.
  bool? _autenticado;
  bool get autenticado => _autenticado ?? false;
  bool hasAutenticado() => _autenticado != null;

  // "ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "negocio" field.
  DocumentReference? _negocio;
  DocumentReference? get negocio => _negocio;
  bool hasNegocio() => _negocio != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _imagen = snapshotData['imagen'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _autenticado = snapshotData['autenticado'] as bool?;
    _ciudad = snapshotData['ciudad'] as String?;
    _negocio = snapshotData['negocio'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('anuncios');

  static Stream<AnunciosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnunciosRecord.fromSnapshot(s));

  static Future<AnunciosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnunciosRecord.fromSnapshot(s));

  static AnunciosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnunciosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnunciosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnunciosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnunciosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnunciosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnunciosRecordData({
  String? titulo,
  String? imagen,
  String? descripcion,
  bool? autenticado,
  String? ciudad,
  DocumentReference? negocio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'imagen': imagen,
      'descripcion': descripcion,
      'autenticado': autenticado,
      'ciudad': ciudad,
      'negocio': negocio,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnunciosRecordDocumentEquality implements Equality<AnunciosRecord> {
  const AnunciosRecordDocumentEquality();

  @override
  bool equals(AnunciosRecord? e1, AnunciosRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.imagen == e2?.imagen &&
        e1?.descripcion == e2?.descripcion &&
        e1?.autenticado == e2?.autenticado &&
        e1?.ciudad == e2?.ciudad &&
        e1?.negocio == e2?.negocio;
  }

  @override
  int hash(AnunciosRecord? e) => const ListEquality().hash([
        e?.titulo,
        e?.imagen,
        e?.descripcion,
        e?.autenticado,
        e?.ciudad,
        e?.negocio
      ]);

  @override
  bool isValidKey(Object? o) => o is AnunciosRecord;
}
