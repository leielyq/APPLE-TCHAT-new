import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RadioDemo();
  }
}


class _RadioDemo extends State<RadioDemo> {
  String _newValue = '红色';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: RadioListTile<String>(
                value: '红色',
                title: Text('红色'),
                groupValue: _newValue,
                onChanged: (value) {
                  setState(() {
                    _newValue = value;
                  });
                },
              ),
            ),
            Flexible(
              child: RadioListTile<String>(
                value: '蓝色',
                title: Text('蓝色'),
                groupValue: _newValue,
                onChanged: (value) {
                  setState(() {
                    _newValue = value;
                  });
                },
              ),
            ),
            Flexible(
              child: RadioListTile<String>(
                value: '白色',
                title: Text('白色'),
                groupValue: _newValue,
                onChanged: (value) {
                  setState(() {
                    _newValue = value;
                  });
                },
              ),
            ),
            Flexible(
              child: RadioListTile<String>(
                value: '黄色',
                title: Text('黄色'),
                groupValue: _newValue,
                onChanged: (value) {
                  setState(() {
                    _newValue = value;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class RadioDemoS extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RadioDemoS();
  }
}


class _RadioDemoS extends State<RadioDemoS> {
  String _newValue = 'S';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            Flexible(
              child: RadioListTile<String>(
                value: 'S',
                title: Text('S'),
                groupValue: _newValue,
                onChanged: (value) {
                  setState(() {
                    _newValue = value;
                  });
                },
              ),
            ),
            Flexible(
              child: RadioListTile<String>(
                value: 'M',
                title: Text('M'),
                groupValue: _newValue,
                onChanged: (value) {
                  setState(() {
                    _newValue = value;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}


