import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class VoiceButton extends StatefulWidget {
  const VoiceButton({
    Key? key,
    required this.size,
    required this.iconSize,
    required this.onTap,
    this.showBorder = true,
    this.showShadow = true,
    this.isLoading = true,
    this.backgroundColor = const Color(0xff242424),
    this.iconColor = const Color(0xff7000FF),
  }) : super(key: key);
  final double size;
  final double iconSize;
  final Color backgroundColor;
  final Color iconColor;
  final bool showBorder;
  final bool showShadow;
  final Function() onTap;
  final bool isLoading;

  @override
  State<VoiceButton> createState() => _VoiceButtonState();
}

class _VoiceButtonState extends State<VoiceButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    super.initState();

    if (widget.isLoading) {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
      );

      _animationController
        ?..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _animationController?.forward(from: 0);
          }
        });

      _animationController?.forward();
      _animationController?.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.size,
        width: widget.size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          shape: BoxShape.circle,
          boxShadow: (widget.showShadow)
              ? const [
                  BoxShadow(
                    color: Color(0x33FA00FF),
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x33FA00FF),
                    offset: Offset(0, 4),
                    blurRadius: 50,
                    spreadRadius: 0,
                  ),
                ]
              : null,
          border: (widget.showBorder)
              ? GradientBoxBorder(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    transform: (widget.isLoading)
                        ? (_animationController != null)
                            ? GradientRotation(_animationController!.value * 6)
                            : null
                        : null,
                    colors: const [
                      Color(0xff7000FF),
                      Color(0xffFF00B8),
                    ],
                  ),
                )
              : null,
        ),
        child: SvgPicture.asset(
          'assets/voice.svg',
          height: widget.iconSize,
          width: widget.iconSize,
          colorFilter: ColorFilter.mode(
            widget.iconColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
