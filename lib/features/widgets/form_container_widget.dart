import 'package:flutter/material.dart'; // Importing the Flutter material package

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller; // Controller for the text field
  final Key? fieldKey; // Key for the form field
  final bool? isPasswordField; // Flag to indicate if this is a password field
  final String? hintText; // Hint text for the text field
  final String? labelText; // Label text for the text field
  final String? helperText; // Helper text for the text field
  final FormFieldSetter<String>? onSaved; // Callback for when the field is saved
  final FormFieldValidator<String>? validator; // Validator for the field
  final ValueChanged<String>? onFieldSubmitted; // Callback for when the field is submitted
  final TextInputType? inputType; // Input type for the text field

  const FormContainerWidget(
      {super.key,
      this.controller,
      this.fieldKey,
      this.isPasswordField,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType}); // Constructor for FormContainerWidget

  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState(); // Creating the state for FormContainerWidget
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true; // Flag to indicate if the text should be obscured

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Setting the container width to full
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35), // Setting the background color with opacity
        borderRadius: BorderRadius.circular(15), // Setting the border radius
      ),
      child: TextFormField(
        style: const TextStyle(color: Colors.blue), // Setting the text style
        controller: widget.controller, // Assigning the controller
        keyboardType: widget.inputType, // Assigning the input type
        key: widget.fieldKey, // Assigning the key
        obscureText: widget.isPasswordField == true ? _obscureText : false, // Obscuring text if it's a password field
        onSaved: widget.onSaved, // Assigning the onSaved callback
        validator: widget.validator, // Assigning the validator
        onFieldSubmitted: widget.onFieldSubmitted, // Assigning the onFieldSubmitted callback
        decoration: InputDecoration(
            border: InputBorder.none, // Removing the border
            filled: true, // Enabling the filled property
            hintText: widget.hintText, // Setting the hint text
            hintStyle: const TextStyle(color: Colors.black45), // Setting the hint text style
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText; // Toggling the obscure text flag
                  });
                },
                child: widget.isPasswordField == true // If it's a password field
                    ? Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility, // Toggling the visibility icon
                        color:
                            _obscureText == false ? Colors.blue : Colors.grey, // Setting the icon color
                      )
                    : const Text("")) // If it's not a password field, display an empty text widget
        ),
      ),
    );
  }
}
