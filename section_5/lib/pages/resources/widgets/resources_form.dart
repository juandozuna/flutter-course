import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:section_5/core/color.dart';
import 'package:section_5/core/validators.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/models/resource_model.dart';
import 'package:section_5/providers/resources_provider.dart';
import 'package:section_5/theme/theme.dart';
import 'package:section_5/util.dart';
import 'package:section_5/widgets/app_text_field.dart';
import 'package:section_5/widgets/center_circular_loading.dart';

class ResourcesForm extends StatefulWidget {
  final Resource? resource;

  bool get isEditing => resource != null;

  const ResourcesForm({Key? key, this.resource}) : super(key: key);

  @override
  State<ResourcesForm> createState() => _ResourcesFormState();
}

class _ResourcesFormState extends State<ResourcesForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode _yearNode = FocusNode();
  FocusNode _pantoneValueNode = FocusNode();

  String? _name;
  int? _year;
  Color? _color;
  String? _pantoneValue;

  Color? _colorPickerColor;

  @override
  void initState() {
    setInitialColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResourcesProvider>(context);
    if (provider.isLoading) {
      return CenterCircularLoading();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                label: 'Name',
                validators: [
                  RequiredValidator(errorText: 'Name is required'),
                  MinLengthValidator(3,
                      errorText: 'Name must be at least 3 characters'),
                ],
                onSaved: (value) => _name = value,
                initialValue: widget.resource?.name,
                nextFocusNode: _yearNode,
              ),
              AppTextField(
                focusNode: _yearNode,
                nextFocusNode: _pantoneValueNode,
                label: 'year',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validators: [
                  RequiredValidator(errorText: 'Year is required'),
                  MinValueValidator(1900,
                      errorText: 'Year must be at least 1900'),
                  MaxValueValidator(2022,
                      errorText: 'Year must be less than 2022'),
                ],
                onSaved: (value) => _year = int.tryParse(value ?? '0'),
                initialValue: widget.resource?.year.toString(),
              ),
              AppTextField(
                focusNode: _pantoneValueNode,
                label: 'pantone value',
                onSaved: (value) => _pantoneValue = value,
                validators: [
                  RequiredValidator(errorText: 'Pantone value is required'),
                  PatternValidator(r'^\d{2}-{1}\d{4}',
                      errorText: 'Invalid pantone value (##-####)'),
                ],
                initialValue: widget.resource?.pantoneValue,
              ),
              _buildColorPicker(),
            ],
          ),
        ),
        _buildSubmitButton(),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        child: Container(
          width: double.infinity,
          child: Text('Submit'),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildColorPicker() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppValues.horizontalMargin,
      ),
      child: ElevatedButton(
        onPressed: showPicker,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: AppValues.verticalMargin),
          child: Text('Select Color'),
        ),
        style: ButtonStyle(
          backgroundColor: propertySetter(_color ?? Colors.grey),
        ),
      ),
    );
  }

  void showPicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: _colorPickerColor ?? Colors.grey,
            onColorChanged: (color) {
              setState(() {
                _colorPickerColor = color;
              });
            },
          ),
        ),
        actions: [
          ElevatedButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _color = _colorPickerColor;
              });
            },
          ),
        ],
      ),
    );
  }

  bool validateForm() {
    final isFormValid = _formKey.currentState!.validate();
    final hasColor = _color != null;
    return isFormValid && hasColor;
  }

  void submitForm() {
    final form = _formKey.currentState!;

    final isValid = validateForm();

    if (!isValid) {
      return;
    }

    form.save();

    final hexColor = _color!.toHex();
    final resource = Resource(
      name: _name!,
      year: _year!,
      color: hexColor,
      pantoneValue: _pantoneValue!,
    );

    final provider = get<ResourcesProvider>();
    provider.addResource(resource);
  }

  void setInitialColor() {
    if (!widget.isEditing) {
      return;
    }

    final color = HexColor(widget.resource!.color);
    _color = color;
    _colorPickerColor = color;
  }
}
