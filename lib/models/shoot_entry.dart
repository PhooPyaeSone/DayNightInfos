class ShootEntry {
  ShootEntry({this.name});
  final String name;

  List<String> _filters = [];

  List<String> get filters {
    return _filters;
  }
}
