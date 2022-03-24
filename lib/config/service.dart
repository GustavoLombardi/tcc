abstract class ServiceApp {
  static String ip = "192.168.1.174";
  static String port = "8000";

  static changeService(String ip, String port) {
    ServiceApp.ip = ip;
    ServiceApp.port = port;
  }
}
