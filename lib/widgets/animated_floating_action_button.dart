import 'package:flutter/material.dart';

class AnimatedFloatingActionButton extends StatefulWidget {
  const AnimatedFloatingActionButton(
      {super.key,
      this.backgroundColor,
      required this.expandedHeight,
      required this.expandedWidth})
      : assert(expandedWidth >= minimumWidth),
        assert(expandedHeight >= minimumHeight);
  final Color? backgroundColor;
  final double expandedHeight;
  final double expandedWidth;
  static const double minimumHeight = 4.0;
  static const double minimumWidth = 4.0;

  @override
  State<AnimatedFloatingActionButton> createState() =>
      _AnimatedFloatingActionButtonState();
}

class _AnimatedFloatingActionButtonState
    extends State<AnimatedFloatingActionButton> {
  bool isClicked = false;
  void toggleClick() {
    setState(() {
      isClicked = isClicked ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: Colors.black26, offset: Offset(2, 2), blurRadius: 2.0)
        ],
      ),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        shadowColor: Colors.black,
        color: widget.backgroundColor ??
            Theme.of(context).colorScheme.inversePrimary,
        child: InkWell(
          overlayColor: isClicked
              ? const MaterialStatePropertyAll(Colors.transparent)
              : null,
          enableFeedback: isClicked ? false : true,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          splashColor: isClicked ? null : Colors.grey.withOpacity(0.2),
          splashFactory: isClicked ? null : InkSplash.splashFactory,
          onTap: () => isClicked
              ? null
              : {toggleClick(), print(screenSize.width * 14 / 100)},
          child: AnimatedContainer(
            margin: EdgeInsets.all(screenSize.width * 0 / 100),
            duration: const Duration(milliseconds: 150),
            height:
                isClicked ? widget.expandedHeight : screenSize.width * 14 / 100,
            width:
                isClicked ? widget.expandedWidth : screenSize.width * 14 / 100,
            child: isClicked
                ? ListTile(
                    visualDensity: VisualDensity(),
                  )
                : const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
