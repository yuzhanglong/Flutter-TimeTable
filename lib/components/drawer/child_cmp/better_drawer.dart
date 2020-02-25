import 'package:flutter/material.dart';

//BetterDrawer可以 解决flutter源代码的drawer不能自定义宽度的问题

class BetterDrawer extends StatelessWidget {
  final double elevation;
  final Widget child;
  final String semanticLabel;
  final double widthPercent;


  const BetterDrawer({
    Key key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
    this.widthPercent = 0.5,
  }) : assert(elevation != null && elevation >= 0.0),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String label = semanticLabel;
    label = semanticLabel ?? MaterialLocalizations.of(context)?.drawerLabel;

    final double _width = MediaQuery.of(context).size.width * widthPercent;

    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(width: _width),
        child: Material(
          elevation: elevation,
          child: child,
        ),
      ),
    );
  }
}
