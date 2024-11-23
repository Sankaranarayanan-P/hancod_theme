// ignore_for_file: strict_raw_type

part of '../forms.dart';

class AppTextForm<T> extends AppForm<T> {
  const AppTextForm({
    required super.name,
    super.label,
    super.key,
    super.boxShadow,
    super.padding,
    this.hintText,
    super.initialValue,
    super.fieldKey,
    this.onChanged,
    this.inputFormatters,
    this.minLines = 1,
    this.controller,
    this.enableObscureText = false,
    this.keyboardType,
    super.validator,
    this.onSubmitted,
    this.focusNode,
    super.enabled,
    this.prefixIcon,
    this.suffix,
    this.isReadOnly = false,
    super.decoration,
    this.labelText,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  final void Function(T? value)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int minLines;
  final String? hintText;
  final TextEditingController? controller;
  final bool enableObscureText;
  final TextInputType? keyboardType;
  final void Function(T value)? onSubmitted;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffix;
  final bool isReadOnly;
  final String? labelText;
  final AutovalidateMode autovalidateMode;

  @override
  State<AppTextForm<T>> createState() => _AppTextFormState();
}

class _AppTextFormState<T> extends State<AppTextForm<T>> {
  bool isObscure = true;
  late GlobalKey<FormBuilderFieldState> key;
  @override
  void initState() {
    super.initState();
    key = widget.fieldKey ?? GlobalKey<FormBuilderFieldState>();
  }

  @override
  Widget build(BuildContext context) {
    return widget.buildContainer(
      context,
      FormBuilderTextField(
        name: widget.name,
        enabled: widget.enabled,
        autovalidateMode: widget.autovalidateMode,
        key: key,
        controller: widget.controller,
        decoration:
            (widget.decoration ?? AppTheme.defaultInputDecoration).copyWith(
          suffix: widget.suffix,
          hintText: widget.hintText,
          labelText: widget.labelText,
        ),
        onChanged: (val) {
          widget.onChanged?.call(
            switch (T) {
              String => val as T?,
              int => val == null ? null : int.tryParse(val) as T?,
              double => val == null ? null : double.tryParse(val) as T?,
              _ => val as T?
            },
          );
        },
        validator: (val) {
          return switch (T) {
            String => widget.validator?.call(val as T?),
            int => val == null
                ? null
                : widget.validator?.call(int.tryParse(val) as T?),
            double => val == null
                ? null
                : widget.validator?.call(double.tryParse(val) as T?),
            Type() => widget.validator?.call(val as T?),
          };
        },
        initialValue: switch (T) {
          String => widget.initialValue as String?,
          int => widget.initialValue?.toString(),
          double => widget.initialValue?.toString(),
          _ => widget.initialValue?.toString()
        },
        valueTransformer: (value) {
          return switch (T) {
            String => value as T?,
            int => value == null ? null : int.tryParse(value) as T?,
            double => value == null ? null : double.tryParse(value) as T?,
            _ => value as T?
          };
        },
        readOnly: widget.isReadOnly,
        minLines: widget.minLines,
        focusNode: widget.focusNode,
        obscureText: widget.enableObscureText && isObscure,
        maxLines: widget.minLines,
        inputFormatters: [
          if (T == double)
            FilteringTextInputFormatter.allow(
              RegExp(r'^\d*\.?\d*$'),
            ),
          if (T == int)
            FilteringTextInputFormatter.allow(
              RegExp(r'^[0-9]*$'),
            ),
          ...widget.inputFormatters ?? [],
        ],
        keyboardType: widget.keyboardType,
        onSubmitted: (value) {
          if (value == null) return;
          widget.onSubmitted?.call(
            switch (T) {
              String => value as T,
              int => int.tryParse(value) as T,
              double => double.tryParse(value) as T,
              _ => value as T
            },
          );
        },
      ),
    );
  }
}
