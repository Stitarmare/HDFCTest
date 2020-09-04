import 'dart:html' as html;

class LocalWebDatasource {
  void addCookie(String key, dynamic value) {
    html.window.localStorage[key] = value;
  }

  dynamic getCookie(String key) {
    return html.window.localStorage[key];
  }
}
