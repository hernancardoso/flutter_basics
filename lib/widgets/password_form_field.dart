import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final onSaved;
  final InputDecoration? inputDecoration;
  PasswordFormField({Key? key, this.onSaved, this.inputDecoration})
      : super(key: key);

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'Please enter a valid password';
        if (value.length <= 5) return 'Password is too short';
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: Listener(
          onPointerDown: (_) => setState(() {
            _hidePassword = false;
          }),
          onPointerUp: (_) => setState(() {
            _hidePassword = true;
          }),
          child: Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Icon(
              (_hidePassword) ? Icons.visibility : Icons.visibility_off,
              size: 20,
            ),
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
      obscureText: _hidePassword,
      onSaved: (widget.onSaved),
    );
  }
}
