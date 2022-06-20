// ignore_for_file: unused_local_variable, unused_field, unused_element

Future<void> makeFirstRequest() {
  return Future.delayed(Duration(seconds: 2), () {
    print('First request');
  });
}

Future<void> makeSecondRequest() {
  return Future.delayed(Duration(seconds: 3), () {
    print('Second request');
  });
}

void performRequest() {
  makeFirstRequest().then((_) {
    makeSecondRequest();
  }).catchError((error) {
    print(error);
  });
}

void performAsyncRequest() async {
  try {
    await makeFirstRequest();
    await makeSecondRequest();
  } catch (error) {
    print(error);
  }
}
