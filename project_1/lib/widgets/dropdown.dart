import 'dart:ui';
import 'package:flutter/material.dart';

class DropdownField extends StatefulWidget {
  final String? descriptionText;
  final String? hintText;
  final bool? isRequired;
  final List<ListItem> list;
  final bool selectItemByDefault;
  final int? selectedValue;
  final void Function(String)? onChange;

  const DropdownField(
      {Key? key,
      this.descriptionText,
      this.hintText,
      this.isRequired,
      required this.list,
      this.onChange,
      this.selectedValue,
      this.selectItemByDefault = false});

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class ListItem {
  final int id;
  final String value;

  const ListItem(this.id, this.value);
}

class _DropdownFieldState extends State<DropdownField> {
  String? _value;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => initialize());
  }

  void initialize() async {
    if (!widget.selectItemByDefault) return;
    await Future.delayed(Duration(milliseconds: 500));
    final found = widget.list.firstWhere(
        (element) => element.id == widget.selectedValue,
        orElse: () => null);
    if (found == null) return;
    _onChangeHappened(found.id.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant DropdownField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectItemByDefault) {
      final found = widget.list.firstWhere(
          (element) => element.id == widget.selectedValue,
          orElse: () => null);
      if (found == null) return;
      _onChangeHappened(found.id.toString());
    }
    if (widget.selectedValue != null) {
      _value = widget.selectedValue.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        key: Key('content-column'),
        children: <Widget>[
          _buildTitle(),
          Padding(
            key: Key('input-padding'),
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                _buildDropdownField(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle() {
    const fontSize = 16;
    final descriptionText = widget.descriptionText;
    return Padding(
      key: Key('title-padding'),
      padding: const EdgeInsets.only(top: 5, bottom: 0, left: 5, right: 5),
      child: Align(
        key: Key('title-align'),
        alignment: Alignment.topLeft,
        child: Text(
          descriptionText + (widget.isRequired == true ? '*' : ''),
          key: Key('text-title'),
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      key: Key('dropdown-field'),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      height: 50,
      child: Center(
        child: Padding(
          key: Key('dropdown-padding'),
          padding: const EdgeInsets.only(
            left: 13,
            right: 20,
          ),
          child: _buildDropdown(),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        key: Key('dropdown-btn'),
        items: widget.list
            .map((item) => _buildDropdownItem(item) as DropdownMenuItem<String>)
            .toList(),
        isExpanded: true,
        onChanged: (String value) {
          _onChangeHappened(value);
        },
        hint: Text(
          widget.hintText,
        ),
        value: _value,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  void _onChangeHappened(String value) {
    widget.onChange(value);
    setState(() {
      _value = value;
    });
  }

  Widget _buildDropdownItem(ListItem item) {
    final itemId = item.id;
    return DropdownMenuItem<String>(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              item.name,
              key: Key('dropdown-item'),
            ),
          ),
        ],
      ),
      value: '$itemId',
    );
  }
}
