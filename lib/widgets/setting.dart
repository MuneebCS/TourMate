import 'package:flutter/material.dart';
import 'package:tourmate/widgets/custom_button.dart';

class Setting extends StatefulWidget {
  final String settingName;
  final CustomButton customButton;

  Setting({
    required this.settingName,
    required this.customButton,
  });

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _isTapped = false;

  void _handleTap(bool isTapped) {
    setState(() {
      _isTapped = isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _handleTap(true),
      onTapUp: (_) => _handleTap(false),
      onTapCancel: () => _handleTap(false),
      onDoubleTap: () => _handleTap(false),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: _isTapped ? Border.all(color: Colors.transparent) : null,
          color: _isTapped ? Theme.of(context).cardColor : Colors.transparent,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                widget.settingName,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 14,
                    ),
              ),
            ),
            Container(
              height: 70,
              width: 40,
              decoration: BoxDecoration(
                border:
                    _isTapped ? Border.all(color: Colors.transparent) : null,
                borderRadius: BorderRadius.circular(12),
                color: _isTapped ? const Color(0xFF345F64) : Colors.transparent,
              ),
              child: widget.customButton,
            ),
          ],
        ),
      ),
    );
  }
}
