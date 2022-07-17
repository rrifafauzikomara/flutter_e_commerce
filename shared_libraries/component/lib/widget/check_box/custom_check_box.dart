import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorName.white,
      child: InkWell(
        onTap: () {
          setState(() {
            _selected = !_selected;
            widget.onChanged!(_selected);
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: _selected ? ColorName.orange : ColorName.white,
              border: Border.all(
                color: _selected ? ColorName.orange : ColorName.textDarkGrey,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          height: 24.w,
          width: 24.w,
          child: _selected
              ? const Icon(
                  Icons.check,
                  color: ColorName.white,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
