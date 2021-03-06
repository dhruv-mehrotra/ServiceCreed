import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController _controller;
  final String _label;
  final String _hint;
  final IconData _prefix;
  final String Function(String) _validator;
  final IconButton _suffix;
  final int _maxlines;
  final bool _isHidden;
  final TextInputType _keyBoardType;
  CustomTextField(this._controller, this._label, this._hint, this._prefix,
      {IconButton suffix,
      bool isHidden = false,
      int maxlines = 1,
      TextInputType keyBoardType = TextInputType.name,
      String Function(String) validator})
      : _suffix = suffix,
        _maxlines = maxlines,
        _isHidden = isHidden,
        _validator = validator,
        _keyBoardType = keyBoardType;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget._isHidden,
      controller: widget._controller,
      validator: widget._validator,
      maxLines: widget._maxlines,
      style: TextStyle(fontSize: 18.0),
      keyboardType: widget._keyBoardType,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          focusColor: Colors.white,
          labelText: widget._label,
          hintText: widget._hint,
          labelStyle: TextStyle(
            fontSize: 18.0,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.blue)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          prefixIcon: widget._prefix != null ? Icon(widget._prefix) : null,
          suffixIcon: widget._suffix),
    );
  }
}
