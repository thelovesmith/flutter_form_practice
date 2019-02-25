import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Validation Form';
    return MaterialApp(
        title: appTitle,
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
            backgroundColor: Colors.green,
          ),
          body: MyCustomForm(),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  final formController = TextEditingController();
  final formController2 = TextEditingController();
  final formController3 = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    formController.dispose();
    formController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      //form widget buitl with above formKey
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            enableInteractiveSelection: true,
            // The validator receives the text the user has typed in
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
            controller: formController,
          ),
          TextFormField(
            // The validator receives the text the user has typed in
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text 2';
              }
            },
            controller: formController2,
          ),
          TextFormField(
            // The validator receives the text the user has typed in
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text 2';
              }
            },
            controller: formController3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                print(formController.text);
                print(formController2.text);
                print(formController3.text);
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                // If the form is valid, display a snackbar with the value of the secon form text input. In the real world, you'd
                // often want to call a server or save the information in a database
                if (_formKey.currentState.validate()) {
                  // Scaffold.of(context).showSnackBar(
                  //     SnackBar(content: Text(formController2.text)));
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the user has typed in using our
                        // TextEditingControllers
                        //Display the submitted text as a list of tile widgets 
                        content: Column(
                          children: <Widget>[
                            ListTile(title: Text(formController.text)),
                            ListTile(title: Text(formController2.text)),
                            ListTile(title: Text(formController3.text)),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
