import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    this.color = KColors.kThemeYellow,
    this.thickness = 4.0,
  }) : super(key: key);
  final Color color;
  final double thickness;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: thickness,
      ),
    );
  }
}
