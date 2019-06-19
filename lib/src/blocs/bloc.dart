import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'validators.dart';

class Bloc extends Object with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Change Data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Add Data To Stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  //Clean Up Objects
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
