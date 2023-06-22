const oneItem = """
import 'package:flutter/material.dart';
import '../../../core/exports/constants_exports.dart';

class OneItem extends StatelessWidget {
  final String title;
  final int index;

  const OneItem({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text((index + 1).toString()),
      title: Text(
        title,
        style: TextStyleConstants.regularStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
""";
