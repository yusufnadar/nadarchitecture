extension StringExtension on String {
  String? emailValidator() {
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
            .hasMatch(this) ==
        true) {
      return 'Email address is invalid';
    }
    return null;
  }

  String? passwordValidator() {
    if (this == '') {
      return 'Can not be empty';
    } else {
      return null;
    }
  }
}
