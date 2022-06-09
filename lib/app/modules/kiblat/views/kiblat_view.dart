import 'package:flutter/material.dart';

import 'package:stay_sunnah/app/modules/kiblat/views/kiblat.dart';

class KiblatView extends StatelessWidget {
  const KiblatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KiblatView'),
        centerTitle: true,
      ),
      body: const MyApp(),
      // body: Builder(builder: (context) {
      //   if (controller.hasPermissions.value) {
      //     return Obx(() {
      //       return Column(
      //         children: <Widget>[
      //           _buildManualReader(),
      //           Expanded(child: _buildCompass()),
      //         ],
      //       );
      //     });
      //   } else {
      //     return _buildPermissionSheet();
      //   }
      // }),
    );
  }

  // Widget _buildManualReader() {
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: Row(
  //       children: <Widget>[
  //         ElevatedButton(
  //           child: Text('Read Value'),
  //           onPressed: () async {
  //             final CompassEvent tmp = await FlutterCompass.events!.first;
  //             controller.readValue(tmp, DateTime.now());
  //             // setState(() {
  //             //   _lastRead = tmp;
  //             //   _lastReadAt = DateTime.now();
  //             // });
  //           },
  //         ),
  //         Expanded(
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Text(
  //                   '${controller.lastRead}',
  //                   // style: Theme.of(context).textTheme.caption,
  //                 ),
  //                 Text(
  //                   '${controller.lastReadAt}',
  //                   // style: Theme.of(context).textTheme.caption,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildCompass() {
  //   return StreamBuilder<CompassEvent>(
  //     stream: FlutterCompass.events,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return Text('Error reading heading: ${snapshot.error}');
  //       }

  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }

  //       double? direction = snapshot.data!.heading;

  //       // if direction is null, then device does not support this sensor
  //       // show error message
  //       if (direction == null)
  //         return Center(
  //           child: Text("Device does not have sensors !"),
  //         );

  //       return Material(
  //         shape: CircleBorder(),
  //         clipBehavior: Clip.antiAlias,
  //         elevation: 4.0,
  //         child: Container(
  //           padding: EdgeInsets.all(16.0),
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //           ),
  //           child: Transform.rotate(
  //             angle: (direction * (math.pi / 180) * -1),
  //             child: Image.asset(Images.compass),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget _buildPermissionSheet() {
  //   return Center(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         Text('Location Permission Required'),
  //         ElevatedButton(
  //           child: Text('Request Permissions'),
  //           onPressed: () {
  //             Permission.locationWhenInUse.request().then((ignored) {
  //               controller.fetchPermissionStatus();
  //             });
  //           },
  //         ),
  //         SizedBox(height: 16),
  //         ElevatedButton(
  //           child: Text('Open App Settings'),
  //           onPressed: () {
  //             openAppSettings().then((opened) {
  //               //
  //             });
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }
}
