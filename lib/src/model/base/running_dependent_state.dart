part of sci_model_base;

class RunningDependentStateBase extends State {
  static const List<String> PROPERTY_NAMES = [];
  static const List<String> REF_PROPERTY_NAMES = [];
  static const List<base.RefId> REF_IDS = [];

  RunningDependentStateBase();
  RunningDependentStateBase.json(Map m) : super.json(m) {
    subKind = base.subKindForClass(Vocabulary.RunningDependentState_CLASS, m);
  }

  static RunningDependentState createFromJson(Map m) =>
      RunningDependentStateBase.fromJson(m);
  static RunningDependentState _createFromJson(Map? m) => m == null
      ? RunningDependentState()
      : RunningDependentStateBase.fromJson(m);
  static RunningDependentState fromJson(Map m) {
    final kind = m[Vocabulary.KIND] as String;
    switch (kind) {
      case Vocabulary.RunningDependentState_CLASS:
        return RunningDependentState.json(m);
      default:
        throw base.createBadKindError(kind);
    }
  }

  @override
  String get kind => Vocabulary.RunningDependentState_CLASS;

  @override
  Iterable<String> getPropertyNames() =>
      super.getPropertyNames().followedBy(PROPERTY_NAMES);
  @override
  Iterable<base.RefId> refIds() => super.refIds().followedBy(REF_IDS);

  @override
  RunningDependentState copy() => RunningDependentState.json(toJson());
  @override
  Map toJson() {
    var m = super.toJson();
    m[Vocabulary.KIND] = Vocabulary.RunningDependentState_CLASS;
    if (subKind != null && subKind != Vocabulary.RunningDependentState_CLASS) {
      m[Vocabulary.SUBKIND] = subKind;
    } else {
      m.remove(Vocabulary.SUBKIND);
    }
    return m;
  }
}
