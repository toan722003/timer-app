import 'package:flutter/cupertino.dart';
import 'package:timer_app/theme/color.dart';

class NoteHomeWidget extends StatefulWidget {
  const NoteHomeWidget({Key? key}) : super(key: key);

  @override
  State<NoteHomeWidget> createState() => _NoteHomeWidgetState();
}

class _NoteHomeWidgetState extends State<NoteHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: UIColor.accentGreen,
    );
  }
}
