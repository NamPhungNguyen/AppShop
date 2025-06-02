class ClientApiEndpoint {
  factory ClientApiEndpoint() => _instance;

  ClientApiEndpoint._internal();

  static final ClientApiEndpoint _instance = ClientApiEndpoint._internal();

  String baseUrl() {
    return "http://192.168.144.197:8080/shopping";
  }
}
