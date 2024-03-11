part of sci_model_base;

class SchemaBase extends ProjectDocument {
  static const List<String> PROPERTY_NAMES = [
    Vocabulary.nRows_DP,
    Vocabulary.columns_OP,
    Vocabulary.dataDirectory_DP,
    Vocabulary.relation_OP
  ];
  static const List<String> REF_PROPERTY_NAMES = [Vocabulary.relation_OP];
  static const List<base.RefId> REF_IDS = [
    base.RefId("Relation", Vocabulary.relation_OP, isComposite: true)
  ];
  int _nRows;
  final base.ListChanged<ColumnSchema> columns;
  String _dataDirectory;
  Relation _relation;

  SchemaBase()
      : _nRows = 0,
        _dataDirectory = "",
        columns = base.ListChanged<ColumnSchema>(),
        _relation = Relation() {
    columns.parent = this;
    _relation.parent = this;
  }

  SchemaBase.json(Map m)
      : _nRows = base.defaultValue(
            m[Vocabulary.nRows_DP] as int?, base.int_DefaultFactory),
        _dataDirectory = base.defaultValue(
            m[Vocabulary.dataDirectory_DP] as String?,
            base.String_DefaultFactory),
        columns = base.ListChanged<ColumnSchema>.from(
            m[Vocabulary.columns_OP] as List?, ColumnSchemaBase.createFromJson),
        _relation =
            RelationBase._createFromJson(m[Vocabulary.relation_OP] as Map?),
        super.json(m) {
    subKind = base.subKindForClass(Vocabulary.Schema_CLASS, m);
    columns.parent = this;
    _relation.parent = this;
  }

  static Schema createFromJson(Map m) => SchemaBase.fromJson(m);
  static Schema _createFromJson(Map? m) =>
      m == null ? Schema() : SchemaBase.fromJson(m);
  static Schema fromJson(Map m) {
    final kind = m[Vocabulary.KIND] as String;
    switch (kind) {
      case Vocabulary.Schema_CLASS:
        return Schema.json(m);
      case Vocabulary.CubeQueryTableSchema_CLASS:
        return CubeQueryTableSchema.json(m);
      case Vocabulary.TableSchema_CLASS:
        return TableSchema.json(m);
      case Vocabulary.ComputedTableSchema_CLASS:
        return ComputedTableSchema.json(m);
      default:
        throw base.createBadKindError(kind);
    }
  }

  @override
  String get kind => Vocabulary.Schema_CLASS;
  int get nRows => _nRows;

  set nRows(int $o) {
    if ($o == _nRows) return;
    var $old = _nRows;
    _nRows = $o;
    if (hasListener) {
      sendChangeEvent(
          base.PropertyChangedEvent(this, Vocabulary.nRows_DP, $old, _nRows));
    }
  }

  String get dataDirectory => _dataDirectory;

  set dataDirectory(String $o) {
    if ($o == _dataDirectory) return;
    var $old = _dataDirectory;
    _dataDirectory = $o;
    if (hasListener) {
      sendChangeEvent(base.PropertyChangedEvent(
          this, Vocabulary.dataDirectory_DP, $old, _dataDirectory));
    }
  }

  Relation get relation => _relation;

  set relation(Relation $o) {
    if ($o == _relation) return;
    _relation.parent = null;
    $o.parent = this;
    var $old = _relation;
    _relation = $o;
    if (hasListener) {
      sendChangeEvent(base.PropertyChangedEvent(
          this, Vocabulary.relation_OP, $old, _relation));
    }
  }

  @override
  dynamic get(String $name) {
    switch ($name) {
      case Vocabulary.nRows_DP:
        return nRows;
      case Vocabulary.columns_OP:
        return columns;
      case Vocabulary.dataDirectory_DP:
        return dataDirectory;
      case Vocabulary.relation_OP:
        return relation;
      default:
        return super.get($name);
    }
  }

  @override
  set(String $name, dynamic $value) {
    switch ($name) {
      case Vocabulary.nRows_DP:
        nRows = $value as int;
        return;
      case Vocabulary.dataDirectory_DP:
        dataDirectory = $value as String;
        return;
      case Vocabulary.columns_OP:
        columns.setValues($value as Iterable<ColumnSchema>);
        return;
      case Vocabulary.relation_OP:
        relation = $value as Relation;
        return;
      default:
        super.set($name, $value);
    }
  }

  @override
  Iterable<String> getPropertyNames() =>
      super.getPropertyNames().followedBy(PROPERTY_NAMES);
  @override
  Iterable<base.RefId> refIds() => super.refIds().followedBy(REF_IDS);

  @override
  Schema copy() => Schema.json(toJson());
  @override
  Map toJson() {
    var m = super.toJson();
    m[Vocabulary.KIND] = Vocabulary.Schema_CLASS;
    if (subKind != null && subKind != Vocabulary.Schema_CLASS) {
      m[Vocabulary.SUBKIND] = subKind;
    } else {
      m.remove(Vocabulary.SUBKIND);
    }
    m[Vocabulary.nRows_DP] = nRows;
    m[Vocabulary.columns_OP] = columns.toJson();
    m[Vocabulary.dataDirectory_DP] = dataDirectory;
    m[Vocabulary.relation_OP] = relation.toJson();
    return m;
  }
}
