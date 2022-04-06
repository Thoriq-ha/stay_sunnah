import 'package:flutter/material.dart';

import '../../../../data/models/bacaan_sholat_model.dart';
import '../../../../global/theme/my_component_style.dart';
import '../../../../global/theme/my_text_style.dart';

class ItemBacaanSholat extends StatelessWidget {
  final BacaanSholat data;
  const ItemBacaanSholat(this.data, {Key? key}) : super(key: key);

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
                '${data.id}. ${data.name}',
                style: titleStyle,
              ),
            ),
            verticalSpace(16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${data.arabic}',
                style: titleStyle.copyWith(fontSize: 18),
                textAlign: TextAlign.right,
              ),
            ),
            verticalSpace(12),
            Text(
              '${data.latin}',
              style: titleStyle.copyWith(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
            verticalSpace(20),
            Text(
              'Terjemahan :\n ${data.terjemahan}',
              style: titleStyle.copyWith(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
