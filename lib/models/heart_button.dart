import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  const HeartButton({super.key});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool _isLiked = false ;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:Icon(_isLiked ? Icons.favorite : Icons.favorite_border, color: _isLiked ? Colors.red : Colors.grey,),
      onPressed: (){
        setState( () {_isLiked =! _isLiked;} );
        },
    )
      ;
  }
}
