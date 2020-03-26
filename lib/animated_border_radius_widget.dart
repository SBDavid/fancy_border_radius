import 'package:flutter/material.dart';
import 'fancy_border_radius_widget.dart';
import 'dart:math';
import 'package:flutter/scheduler.dart';

class AnimatedBorderRadiusWidget extends StatefulWidget {

  final double height;
  final double width;

  final double topMin;
  final double topMax;
  final double rightMin;
  final double rightMax;
  final double bottomMin;
  final double bottomMax;
  final double leftMin;
  final double leftMax;

  final double step;

  final Widget child;
  final bool isPlaying;
  final bool rotate;

  const AnimatedBorderRadiusWidget(this.width, this.height,
      {
        Key key,
        this.child,
        this.isPlaying = true,
        this.topMin = 0.3,
        this.topMax = 0.7,
        this.rightMin = 0.3,
        this.rightMax = 0.7,
        this.bottomMin = 0.3,
        this.bottomMax = 0.7,
        this.leftMin = 0.3,
        this.leftMax = 0.7,
        this.step = 0.0005,
        this.rotate = true
      })
      : super(key: key);

  @override
  _State createState() {
    return _State();
  }
}

class _Boundary {
  final double min;
  final double max;

  const _Boundary(this.min, this.max);
}

class _State extends State<AnimatedBorderRadiusWidget> with TickerProviderStateMixin {

  // 动画回调控制
  Ticker _ticker;
  // 当前定点位置
  List<double> _currentPositions;
  // 目标位置
  List<double> _targetPositions;
  // 移动边界
  List<_Boundary> _boundaries;
  // 移动步长
  List<double> _steps;
  // 角度
  double angle = 0;

  @override
  void initState() {
    super.initState();
    _ticker = this.createTicker(_tick);
    _currentPositions = [0.5, 0.5, 0.5, 0.5];
    _boundaries = [
      _Boundary(widget.topMin, widget.topMax),
      _Boundary(widget.rightMin, widget.rightMax),
      _Boundary(widget.bottomMin, widget.bottomMax),
      _Boundary(widget.leftMin, widget.leftMax),
    ];
    _targetPositions = [0,1,2,3].map((index) => _getTargetPosition(index)).toList();
    _steps = [0,0,0,0];
    for (int i=0; i<4; i++) {
      if (_currentPositions[i] <= _targetPositions[i]) {
        _steps[i] = widget.step;
      } else {
        _steps[i] = -widget.step;
      }
    }

    if (widget.isPlaying) {
      _ticker.start();
    }
  }

  @override
  void didUpdateWidget(AnimatedBorderRadiusWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isPlaying != widget.isPlaying) {
      if (widget.isPlaying) {
        _ticker.start();
      } else {
        _ticker.stop();
      }
    }
  }

  void _tick(Duration elapsed) {
    for (int i=0; i<_currentPositions.length; i++) {

      // 计算下一帧移动的位置
      _currentPositions[i] += _steps[i];

      // 重行设置target
      if (_steps[i] >= 0 && _currentPositions[i] > _targetPositions[i]) {
        _targetPositions[i] = _getTargetPosition(i);
        if (_currentPositions[i] <= _targetPositions[i]) {
          _steps[i] = widget.step;
        } else {
          _steps[i] = -widget.step;
        }
      } else if (_steps[i] < 0 && _currentPositions[i] < _targetPositions[i]){
        _targetPositions[i] = _getTargetPosition(i);
        if (_currentPositions[i] <= _targetPositions[i]) {
          _steps[i] = widget.step;
        } else {
          _steps[i] = -widget.step;
        }
      }
    }

    if (widget.rotate) {
      angle += widget.step;
    }

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: FancyBorderRadiusWidget(
        widget.height, widget.width, EdgeInsets.only(
          top: _currentPositions[0],
          right: _currentPositions[1],
          bottom: _currentPositions[2],
          left: _currentPositions[3]
        ),child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _ticker.stop();
    super.dispose();
  }

  double _getTargetPosition(int index) {
    return _boundaries[index].min + Random().nextDouble()*(_boundaries[index].max-_boundaries[index].min);
  }
}