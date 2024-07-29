import 'package:flutter/material.dart';
import '../data/menu.dart';

class MENUBAR extends StatefulWidget {
  final Function(int) onMenuItemSelected;

  MENUBAR({required this.onMenuItemSelected});

  @override
  State<MENUBAR> createState() => _MENUBARState();
}

class _MENUBARState extends State<MENUBAR> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < menuItems.length; i++) ...[
              menuButton(
                context: context,
                text: menuItems[i].name,
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                  });
                  widget.onMenuItemSelected(i);
                },
                isSelected: selectedIndex == i,
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

Widget menuButton({
  required BuildContext context,
  required String text,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      RotatedBox(
        quarterTurns: 3,
        child: TextButton(
          onPressed: onTap,
          child: Column(
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 18,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w600,
                      color: isSelected
                          ? Theme.of(context).secondaryHeaderColor
                          : Colors.grey,
                    ),
              ),
              // set border radius to circular
              Container(
                height: 2,
                width: 16,
                color: isSelected
                    ? Theme.of(context).secondaryHeaderColor
                    : Colors.transparent,
              )
            ],
          ),
        ),
      ),
    ],
  );
}


// 2 changiings i want just
// 1st : i want no distance bw menu bar and 
// 2nd : 