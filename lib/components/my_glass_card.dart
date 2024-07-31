import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatefulWidget {
  final double? gcHieght;
  final double? gcWidth;
  final double? borderRadius;
  final bool? fullSize;
  final BuildContext context;
  final Widget child;
  const GlassCard({
    super.key,
    this.gcHieght,
    this.gcWidth,
    this.borderRadius,
    required this.child,
    this.fullSize,
    required this.context,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  double height = 200;
  @override
  void initState() {
    super.initState();
    height = (widget.fullSize == null
        ? widget.gcHieght ?? height
        : widget.fullSize == true
            ? MediaQuery.of(widget.context).size.height * 0.7
            : height); // غبي فلتر؟
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
      child: SizedBox(
        height: height,
        width: widget.gcWidth ?? 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 12,
                  sigmaY: 12,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 20,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(1),
                      Colors.white.withOpacity(0.01),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
