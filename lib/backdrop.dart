import 'package:flutter/material.dart';

class Backdrop extends StatefulWidget {
  final Widget backLayer;
  final Widget frontLayer;

  const Backdrop({Key? key, required this.backLayer, required this.frontLayer}) : super(key: key);

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  // Animation properties for the PositionedTransition
  late final Animation<RelativeRect> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Create a RelativeRectTween animation to animate the position of the front layer
    _positionAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
      end: const RelativeRect.fromLTRB(0.0, 100.0, 0.0, 0.0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildStack() {
    return Stack(
      children: <Widget>[
        // The background layer
        widget.backLayer,

        // Add the PositionedTransition with RelativeRectTween animation
        PositionedTransition(
          rect: _positionAnimation,
          child: _FrontLayer(child: widget.frontLayer),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backdrop Example'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(46.0), // Shape for AppBar (rounded bottom corners)
            bottomRight: Radius.circular(46.0),
          ),
        ),
      ),
      body: _buildStack(),
    );
  }
}

// Front Layer with custom shape
class _FrontLayer extends StatelessWidget {
  const _FrontLayer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16.0,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(46.0), // Shape for Front Layer (angled cut in top-left)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: child),
        ],
      ),
    );
  }
}
