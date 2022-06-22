import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  void initState() {
    super.initState();
    _checkIfUserIsLoggedIn().then((_) {
      _openWelcomeModal();
    });
  }

  @override
  void didChangeDependencies() {
    MediaQuery.of(context).size;
    //Hacer cualquier acción con esto
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  _checkIfUserIsLoggedIn() {}

  void _openWelcomeModal() {}
}
