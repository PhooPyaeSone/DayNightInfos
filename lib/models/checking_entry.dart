class CheckingEntry {
  final String name;
  CheckingEntry({this.name});

  List<String> _filters = [];

  List<String> get filter {
    return _filters;
  }

  String get getName {
    return name;
  }
}
