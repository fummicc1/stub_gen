class ConstructorParameter {
  final String name;
  final String type;
  final bool isRequired;
  final int? positionedAt;

  ConstructorParameter({
    required this.name,
    required this.type,
    required this.isRequired,
    this.positionedAt,
  });

  @override
  String toString() {
    return 'ConstructorParameter{name: $name, type: $type, isRequired: $isRequired}';
  }
}
