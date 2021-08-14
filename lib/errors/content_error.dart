abstract class ContentError implements Exception {
  String message;

  @override
  String toString() {
    return message;
  }
}

class ContentRepositoryError extends ContentError {
  ContentRepositoryError(String message) {
    this.message = message;
  }
}
