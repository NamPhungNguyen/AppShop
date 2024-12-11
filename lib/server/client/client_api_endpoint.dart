class ClientApiEndpoint {
  factory ClientApiEndpoint() => _instance;
  ClientApiEndpoint._internal();

  static final ClientApiEndpoint _instance =
  ClientApiEndpoint._internal();

  String baseUrl() {
    return "http://192.168.91.165:8080/shopping";
  }
}