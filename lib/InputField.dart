import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final TextEditingController _principleController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();

  String result = '';

  calculate() {
    if (_principleController.text.isEmpty ||
        _rateController.text.isEmpty ||
        _timeController.text.isEmpty) {
      setState(() {
        result = 'Please fill in the input fields';
      });
    } else {
      var x = int.parse(_principleController.text) *
          int.parse(_rateController.text) *
          int.parse(_timeController.text);
      var y = x / 100;

      setState(() {
        result = y.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool areControllersEmpty = _principleController.text.isEmpty ||
        _rateController.text.isEmpty ||
        _timeController.text.isEmpty;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NewWidget(_principleController, 'Principle', 'PRINCIPLE'),
            NewWidget(_timeController, 'Time', "TIME"),
            NewWidget(_rateController, 'Rate', 'RATE'),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 80, right: 80),
          child: ElevatedButton(
            onPressed: () {
              calculate();
            },
            child: const Text("Calculate"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.teal),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(
            horizontal: 80,
          ),
          decoration: BoxDecoration(
            color: areControllersEmpty ? null : Colors.amber,
            borderRadius: areControllersEmpty
                ? null
                : BorderRadius.circular(
                    5,
                  ),
          ),
          child: Center(
            child: Text(
              areControllersEmpty ? result : 'Result: ' + result,
              style: TextStyle(
                  color: areControllersEmpty ? Colors.red : Colors.black),
            ),
          ),
        )
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  // const NewWidget({
  //   Key? key,
  //   required TextEditingController timeController,
  //   required String text,
  // })  : _timeController = timeController, text = text;
  //       super(key: key);

  NewWidget(this._timeController, this.hintText, this.text);

  final TextEditingController _timeController;
  final String hintText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.teal),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
          child: textField(hintText: hintText, controller: _timeController),
        ),
      ],
    );
  }
}

Widget textField(
    {required String hintText, required TextEditingController controller}) {
  return TextField(
    keyboardType: TextInputType.number,
    controller: controller,
    decoration: InputDecoration(
      isDense: true,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
            color: Colors.black, style: BorderStyle.solid, width: 1.0),
      ),
    ),
  );
}
