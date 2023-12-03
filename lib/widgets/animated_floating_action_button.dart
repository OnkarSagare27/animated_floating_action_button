import 'package:flutter/material.dart';

class AnimatedFloatingActionButton extends StatefulWidget {
  const AnimatedFloatingActionButton(
      {super.key,
      this.backgroundColor,
      this.borderRadius,
      this.duration,
      required this.expandedHeight,
      required this.expandedWidth,
      required this.child})
      : assert(expandedWidth >= minimumWidth),
        assert(expandedHeight >= minimumHeight);
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Duration? duration;
  final Widget child;
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
      decoration: BoxDecoration(
        borderRadius:
            widget.borderRadius ?? const BorderRadius.all(Radius.circular(10)),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(2, 2), blurRadius: 2.0)
        ],
      ),
      child: Material(
        borderRadius:
            widget.borderRadius ?? const BorderRadius.all(Radius.circular(10)),
        shadowColor: Colors.black,
        color: widget.backgroundColor ??
            Theme.of(context).colorScheme.inversePrimary,
        child: InkWell(
          overlayColor: isClicked
              ? const MaterialStatePropertyAll(Colors.transparent)
              : null,
          enableFeedback: isClicked ? false : true,
          borderRadius: widget.borderRadius ??
              const BorderRadius.all(Radius.circular(10)),
          splashColor: isClicked ? null : Colors.grey.withOpacity(0.2),
          splashFactory: isClicked ? null : InkSplash.splashFactory,
          onTap: () => isClicked
              ? null
              : {toggleClick(), print(screenSize.width * 14 / 100)},
          child: AnimatedContainer(
            margin: EdgeInsets.all(screenSize.width * 0 / 100),
            duration: widget.duration ?? const Duration(milliseconds: 150),
            height:
                isClicked ? widget.expandedHeight : screenSize.width * 14 / 100,
            width:
                isClicked ? widget.expandedWidth : screenSize.width * 14 / 100,
            child: isClicked
                ? SingleChildScrollView(
                    child: Columnks(
                    children: [
                      widget.child,
                      Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xff60B478)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ))),
                              onPressed: () {},
                              child: Text(
                                'Add task',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    overflow: TextOverflow.fade),
                              )),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xff60B478)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ))),
                              onPressed: () => setState(() {
                                    toggleClick();
                                  }),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    overflow: TextOverflow.fade),
                              )),
                        ],
                      )
                    ],
                  ))
                : const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
