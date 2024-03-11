part of sci_model_base;

class NamedFilterBase extends Filter {
  static const List<String> PROPERTY_NAMES = [
    Vocabulary.meta_OP,
    Vocabulary.name_DP
  ];
  static const List<String> REF_PROPERTY_NAMES = [];
  static const List<base.RefId> REF_IDS = [];
  final base.ListChanged<Pair> meta;
  String _name;

  NamedFilterBase()
      : _name = "",
        meta = base.ListChanged<Pair>() {
    meta.parent = this;
  }

  NamedFilterBase.json(Map m)
      : _name = base.defaultValue(
            m[Vocabulary.name_DP] as String?, base.String_DefaultFactory),
        meta = base.ListChanged<Pair>.from(
            m[Vocabulary.meta_OP] as List?, PairBase.createFromJson),
        super.json(m) {
    subKind = base.subKindForClass(Vocabulary.NamedFilter_CLASS, m);
    meta.parent = this;
  }

  static NamedFilter createFromJson(Map m) => NamedFilterBase.fromJson(m);
  static NamedFilter _createFromJson(Map? m) =>
      m == null ? NamedFilter() : NamedFilterBase.fromJson(m);
  static NamedFilter fromJson(Map m) {
    final kind = m[Vocabulary.KIND] as String;
    switch (kind) {
      case Vocabulary.NamedFilter_CLASS:
        return NamedFilter.json(m);
      default:
        throw base.createBadKindError(kind);
    }
  }

  @override
  String get kind => Vocabulary.NamedFilter_CLASS;
  String get name => _name;

  set name(String $o) {
    if ($o == _name) return;
    var $old = _name;
    _name = $o;
    if (hasListener) {
      sendChangeEvent(
          base.PropertyChangedEvent(this, Vocabulary.name_DP, $old, _name));
    }
  }

  @override
  dynamic get(String $name) {
    switch ($name) {
      case Vocabulary.meta_OP:
        return meta;
      case Vocabulary.name_DP:
        return name;
      default:
        return super.get($name);
    }
  }

  @override
  set(String $name, dynamic $value) {
    switch ($name) {
      case Vocabulary.name_DP:
        name = $value as String;
        return;
      case Vocabulary.meta_OP:
        meta.setValues($value as Iterable<Pair>);
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
  NamedFilter copy() => NamedFilter.json(toJson());
  @override
  Map toJson() {
    var m = super.toJson();
    m[Vocabulary.KIND] = Vocabulary.NamedFilter_CLASS;
    if (subKind != null && subKind != Vocabulary.NamedFilter_CLASS) {
      m[Vocabulary.SUBKIND] = subKind;
    } else {
      m.remove(Vocabulary.SUBKIND);
    }
    m[Vocabulary.meta_OP] = meta.toJson();
    m[Vocabulary.name_DP] = name;
    return m;
  }
}
