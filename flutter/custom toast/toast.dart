import 'package:flutter/material.dart';

enum ToastType { success, warning, error }

//call this function toshow toast
showToast(
    {required BuildContext context,
    required String title,
    String description = "",
    required ToastType type}) {
  IconData? icon;
  Color? color;
  if (type == ToastType.warning) {
    icon = Icons.warning;
    color = Colors.amber.shade700;
  } else if (type == ToastType.success) {
    icon = Icons.check;
    color = Colors.green;
  } else if (type == ToastType.error) {
    icon = Icons.error;
    color = Colors.red.shade600;
  }
  late OverlayEntry toastOverlay;
  toastOverlay = OverlayEntry(
    builder: (context) => Toast(
      title: title,
      description: description,
      icon: icon!,
      overlayEntry: toastOverlay,
      color: color!,
    ),
  );
  Overlay.of(context)!.insert(toastOverlay);
}

//widget
class Toast extends StatefulWidget {
  const Toast(
      {Key? key,
      required this.color,
      required this.title,
      required this.description,
      required this.icon,
      required this.overlayEntry})
      : super(key: key);
  final Color color;
  final IconData icon;
  final String title, description;
  final OverlayEntry overlayEntry;
  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      animationController
          .reverse()
          .whenComplete(() => widget.overlayEntry.remove());
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final Color toastBgColor = widget.color;
    return Positioned(
      bottom: MediaQuery.of(context).viewInsets.bottom,
      child: FadeTransition(
        opacity: animation,
        child: Material(
          child: Container(
            key: key,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: MediaQuery.of(context).size.width,
            color: toastBgColor,
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    widget.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.description,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
