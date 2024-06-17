class Config {
  static const String apiScheme = 'https';
  static const String apiHost = 'ctracker-server.onrender.com';
  static const String apiBaseUrl = '$apiScheme://$apiHost';

  // static const String apiBaseUrl = bool.fromEnvironment('dart.vm.product')
  //     ? 'https://ctracker-server.onrender.com'
  //     : 'http://localhost:3333';
}
