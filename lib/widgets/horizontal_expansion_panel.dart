import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class HorizontalExpansionPanel extends StatefulWidget {
  const HorizontalExpansionPanel({super.key});

  @override
  HorizontalExpansionPanelState createState() =>
      HorizontalExpansionPanelState();
}

class HorizontalExpansionPanelState extends State<HorizontalExpansionPanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Provider.of<ThemeProvider>(context).isDarkMode
                  ? Colors.grey
                  : const Color(0xFF7E969C),
            ),
            duration: const Duration(milliseconds: 300),
            width: _isExpanded ? 250 : 50,
            height: 50,
            child: Center(
              child: _isExpanded
                  ? Text(
                      'Coming Soon...',
                      style: TextStyle(
                          fontSize: 18,
                          color: Provider.of<ThemeProvider>(context).isDarkMode
                              ? Colors.white
                              : Colors.black),
                    )
                  : Icon(
                      Icons.list,
                      size: 30,
                      color: Provider.of<ThemeProvider>(context).isDarkMode
                          ? Colors.white
                          : Colors.black,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
