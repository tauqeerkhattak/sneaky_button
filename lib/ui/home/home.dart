import 'dart:developer';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

enum Direction {
  none,
  up,
  down,
  left,
  right,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class _HomeState extends State<Home> {
  Offset? buttonPosition;
  Offset? lastPosition;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final size = MediaQuery.of(context).size;
      buttonPosition = Offset(size.width / 2, size.height / 2);
      lastPosition = buttonPosition;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: _onHover,
        child: Stack(
          children: [
            Positioned(
              left: buttonPosition?.dx,
              top: buttonPosition?.dy,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Press me!',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onHover(PointerEvent event) {
    if (buttonPosition != null && lastPosition != null) {
      final direction = _getDirection(event.position);
      lastPosition = buttonPosition;
      _moveButton(direction, buttonPosition!.dx, buttonPosition!.dy);
      setState(() {});
    } else {
      log('Null');
    }
  }

  Direction _getDirection(Offset mouse) {
    final mouseDx = mouse.dx;
    final mouseDy = mouse.dy;
    final lastDx = lastPosition!.dx;
    final lastDy = lastPosition!.dy;
    if (mouseDx == lastDx && mouseDy == lastDy) {
      return Direction.none;
    } else if (mouseDx > lastDx && mouseDy == lastDy) {
      return Direction.right;
    } else if (mouseDx < lastDx && mouseDy == lastDy) {
      return Direction.left;
    } else if (mouseDx == lastDx && mouseDy > lastDy) {
      return Direction.down;
    } else if (mouseDx == lastDx && mouseDy < lastDy) {
      return Direction.up;
    } else if (mouseDx > lastDx && mouseDy > lastDy) {
      return Direction.bottomRight;
    } else if (mouseDx > lastDx && mouseDy < lastDy) {
      return Direction.topRight;
    } else if (mouseDx < lastDx && mouseDy > lastDy) {
      return Direction.bottomLeft;
    } else if (mouseDx < lastDx && mouseDy < lastDy) {
      return Direction.topLeft;
    } else {
      return Direction.none;
    }
  }

  void _moveButton(Direction direction, double dx, double dy) {
    switch (direction) {
      case Direction.none:
        // Do nothing
        break;
      case Direction.up:
        buttonPosition = Offset(
          dx,
          dy + 20,
        );
        break;
      case Direction.down:
        buttonPosition = Offset(
          dx,
          dy - 20,
        );
        break;
      case Direction.left:
        buttonPosition = Offset(
          dx - 20,
          dy,
        );
        break;
      case Direction.right:
        buttonPosition = Offset(
          dx + 20,
          dy,
        );
        break;
      case Direction.topLeft:
        buttonPosition = Offset(
          dx - 20,
          dy - 20,
        );
        break;
      case Direction.topRight:
        buttonPosition = Offset(
          dx + 20,
          dy - 20,
        );
        break;
      case Direction.bottomLeft:
        buttonPosition = Offset(
          dx - 20,
          dy + 20,
        );
        break;
      case Direction.bottomRight:
        buttonPosition = Offset(
          dx + 20,
          dy + 20,
        );
        break;
    }
  }
}
