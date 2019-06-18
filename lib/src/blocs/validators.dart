import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      RegExp emailRegex = new RegExp(r"\w{1,}\@\w{1,}\.\w{1,}");
      if (emailRegex.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Please, enter a valid E-mail!');
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      RegExp passwordRegex = new RegExp(r"[\w\*\#\@\!\&]{4,255}");
      if (passwordRegex.hasMatch(password)) {
        sink.add(password);
      } else {
        if (password.length < 4)
          sink.addError('Password must be atleast 4 characters!');
        if (password.length > 255)
          sink.addError('Password can be atmost 255 characters!');
        sink.addError('Please use valid characters!');
      }
    },
  );
}
