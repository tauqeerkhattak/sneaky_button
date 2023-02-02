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
            AnimatedPositioned(
              duration: const Duration(
                milliseconds: 400,
              ),
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
    final offset = event.position;

    final direction = _getDirection();
    buttonPosition = Offset(
      offset.dx + 20,
      offset.dy + 20,
    );
    _moveButton(direction);
    // buttonPosition = position.;
    lastPosition = buttonPosition;
    setState(() {});
  }

  Direction _getDirection() {
    final mouseDx = buttonPosition!.dx;
    final mouseDy = buttonPosition!.dy;
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

  void _moveButton(Direction direction) {
    switch (direction) {
      case Direction.none:
        // Do nothing
        break;
      case Direction.up:
        break;
      case Direction.down:
        // TODO: Handle this case.
        break;
      case Direction.left:
        // TODO: Handle this case.
        break;
      case Direction.right:
        // TODO: Handle this case.
        break;
      case Direction.topLeft:
        // TODO: Handle this case.
        break;
      case Direction.topRight:
        // TODO: Handle this case.
        break;
      case Direction.bottomLeft:
        // TODO: Handle this case.
        break;
      case Direction.bottomRight:
        // TODO: Handle this case.
        break;
    }
  }
}
