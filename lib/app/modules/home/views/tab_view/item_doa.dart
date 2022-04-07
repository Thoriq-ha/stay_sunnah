import 'package:flutter/material.dart';

import '../../../../data/remote/models/doa_model.dart';
import '../../../../global/theme/my_component_style.dart';
import '../../../../global/theme/my_text_style.dart';

class ItemDoa extends StatelessWidget {
  final Doa data;
  const ItemDoa(this.data, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(
                '${data.title}',
              ),
            ),
            verticalSpace(16),
            Text(
              '${data.arabic}',
              style: titleStyle.copyWith(fontSize: 18),
              textAlign: TextAlign.end,
            ),
            Text(
              'arti :  ${data.translation}',
            ),
          ],
        ),
      ),
    );
  }
}
