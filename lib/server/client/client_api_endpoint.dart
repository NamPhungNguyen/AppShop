class ClientApiEndpoint {
  factory ClientApiEndpoint() => _instance;
  ClientApiEndpoint._internal();

  static final ClientApiEndpoint _instance =
  ClientApiEndpoint._internal();

  String baseUrl() {
    return "http://10.0.88.84:8080/shopping";
  }
}