import 'package:flutter/material.dart';

class APIButton extends StatefulWidget {
  final String textButton;
  final Function onPressed;

  const APIButton({Key? key, required this.textButton, required this.onPressed})
      : super(key: key);

  @override
  APIButtonState createState() => APIButtonState();
}

class APIButtonState extends State<APIButton> {
  bool _isLoading = false;
  void _callApi() async {
    setState(() {
      _isLoading = true;
    });
    await widget.onPressed();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _callApi,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF111A35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : Text(
                  widget.textButton,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
        ),
      ),
    );
  }
}
