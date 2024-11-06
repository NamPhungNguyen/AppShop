class ClientApiEndpoint {
  factory ClientApiEndpoint() => _instance;
  ClientApiEndpoint._internal();

  static final ClientApiEndpoint _instance =
  ClientApiEndpoint._internal();

  String baseUrl() {
    return "http://172.25.32.1:8080/shopping";
  }
}