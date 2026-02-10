import 'package:flutter/material.dart';
import 'package:bistro/app/global_widgets/app_container_widget.dart';

class AppMaterialWidget extends StatelessWidget {
  final double elevation;
  final List<double> borderRadius;
  final Widget? child;
  final List<double> margin;


  const AppMaterialWidget({
    super.key,
    this.elevation = 0,
    this.borderRadius = const [],
    this.child,
    this.margin = const [],

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: margin.isNotEmpty ? margin[0] : 0,
        top: margin.length > 1 ? margin[1] : 0,
        right: margin.length > 2 ? margin[2] : 0,
        bottom: margin.length > 3 ? margin[3] : 0,
      ),
      child: Material(
        elevation: elevation,
        shadowColor: Colors.black.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: borderRadius.isNotEmpty ? Radius.circular(borderRadius[0]) : Radius.zero,
            topRight: borderRadius.length > 1 ? Radius.circular(borderRadius[1]) : Radius.zero,
            bottomLeft: borderRadius.length > 2 ? Radius.circular(borderRadius[2]) : Radius.zero,
            bottomRight: borderRadius.length > 3 ? Radius.circular(borderRadius[3]) : Radius.zero,
          ),
        ),
        child: child,
      ),
    );
  }
}
