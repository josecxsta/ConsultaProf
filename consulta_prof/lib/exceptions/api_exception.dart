class ApiException implements Exception {
  final int code;
  final String message;

  ApiException({this.code, this.message});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ApiException &&
              runtimeType == other.runtimeType &&
              code == other.code;

  @override
  int get hashCode => code.hashCode;

  @override
  String toString() {
    return this.message;
  }
}
