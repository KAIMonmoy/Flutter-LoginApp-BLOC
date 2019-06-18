import 'dart:async';

class Bloc {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  //Change Data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Add Data To Stream
  Stream<String> get email => _emailController.stream;
  Stream<String> get password => _passwordController.stream;
}
