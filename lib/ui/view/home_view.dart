import "dart:async";

import "package:wheniss/data/models/iss_location.dart";
import "package:wheniss/data/repository/home/iss_repository.dart";
import "package:wheniss/services/app_colors.dart";
import "package:wheniss/services/stary_sky_painter.dart";
import "package:wheniss/ui/shared/app_scaffold.dart";
import "package:wheniss/ui/shared/loader.dart";
import "package:wheniss/ui/view_model/iss_view_model.dart";
import "package:flutter/material.dart";
import "package:flutter_3d_controller/flutter_3d_controller.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //Create controller object to control 3D model.
  Flutter3DController controller = Flutter3DController();

  @override
  void initState() {
    super.initState();
    controller.onModelLoaded.addListener(() {
      debugPrint('model is loaded : ${controller.onModelLoaded.value}');
      controller.playAnimation();
    });
  }

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      appBar: true,
      bottomBar: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (_, final WidgetRef ref, final Widget? child) {
              // final IssLocation? issLocation = ref.watch(issLocationProvider);

              // Timer.periodic(Duration(seconds: 5),
                  // (Timer t) => ref.refresh(issLocationRepository));

              // if (issLocation != null) {
                // return SizedBox(
                //     width: MediaQuery.of(context).size.width,
                //     height: MediaQuery.of(context).size.height,
                //     child: Stack(
                //       children: [
                //         FlutterMap(
                //           options: MapOptions(
                //             initialCenter: LatLng(
                //               43.62505,
                //               3.862038,
                //             ), // Center the map over Montpellier
                //             initialZoom: 4,
                //           ),
                //           children: [
                //             TileLayer(
                //               // Display map tiles from any source
                //               urlTemplate:
                //                   'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
                //               userAgentPackageName: 'com.example.app',
                //               // And many more recommended properties!
                //             ),
                //             CircleLayer(
                //               circles: [
                //                 CircleMarker(
                //                   point: LatLng(
                //                     issLocation.latitude,
                //                     issLocation.longitude,
                //                   ),
                //                   color: AppColors.primary.withOpacity(0.1),
                //                   borderStrokeWidth: 1,
                //                   borderColor: AppColors.primary,
                //                   radius: 600000,
                //                   useRadiusInMeter: true,
                //                 ),
                //               ],
                //             ),
                //             MarkerLayer(
                //               markers: [
                //                 Marker(
                //                   point: LatLng(
                //                     issLocation.latitude,
                //                     issLocation.longitude,
                //                   ),
                //                   width: 128,
                //                   height: 128,
                //                   child: //The 3D viewer widget for glb and gltf format
                //                       Flutter3DViewer(
                //                     //If you pass 'true' the flutter_3d_controller will add gesture interceptor layer
                //                     //to prevent gesture recognizers from malfunctioning on iOS and some Android devices.
                //                     // the default value is true
                //                     activeGestureInterceptor: true,
                //                     //If you don't pass progressBarColor, the color of defaultLoadingProgressBar will be grey.
                //                     //You can set your custom color or use [Colors.transparent] for hiding loadingProgressBar.
                //                     progressBarColor: AppColors.primary,
                //                     //You can disable viewer touch response by setting 'enableTouch' to 'false'
                //                     enableTouch: true,
                //                     //This callBack will return the loading progress value between 0 and 1.0
                //                     onProgress: (double progressValue) {
                //                       debugPrint(
                //                           'model loading progress : $progressValue');
                //                     },
                //                     //This callBack will call after model loaded successfully and will return model address
                //                     onLoad: (String modelAddress) {
                //                       debugPrint(
                //                           'model loaded : $modelAddress');
                //                     },
                //                     //this callBack will call when model failed to load and will return failure error
                //                     onError: (String error) {
                //                       debugPrint(
                //                           'model failed to load : $error');
                //                     },
                //                     //You can have full control of 3d model animations, textures and camera
                //                     controller: controller,
                //                     src:
                //                         'assets/glb/iss/source/ISS_stationary.glb', //3D model with different animations
                //                     //src: 'assets/sheen_chair.glb', //3D model with different textures
                //                     //src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb', // 3D model from URL
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             RichAttributionWidget(
                //               // Include a stylish prebuilt attribution widget that meets all requirments
                //               attributions: [
                //                 TextSourceAttribution(
                //                   'OpenStreetMap contributors',
                //                   onTap: () => launchUrl(Uri.parse(
                //                     'https://openstreetmap.org/copyright',
                //                   )), // (external)
                //                 ),
                //                 // Also add images...
                //               ],
                //             ),
                //           ],
                //         ),
                //         Align(
                //           alignment: Alignment.bottomCenter,
                //           child: Padding(
                //             padding: const EdgeInsets.only(top: 20),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   "ISS Location | Latitude: ${issLocation.latitude} | Longitude: ${issLocation.longitude}",
                //                   style: TextStyle(
                //                     fontSize: 20,
                //                     fontWeight: FontWeight.bold,

                //                   ),
                //                   textScaler: TextScaler.linear(0.75),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     ));
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: CustomPaint(
                    size: Size.infinite,
                    painter: StarrySkyPainter(
                      starCount: 300, // Adjust the number of stars
                      starColor: const Color.fromARGB(235, 255, 255, 255), // Color of the stars
                    ),
                    child: Flutter3DViewer(
                      //If you pass 'true' the flutter_3d_controller will add gesture interceptor layer
                      //to prevent gesture recognizers from malfunctioning on iOS and some Android devices.
                      // the default value is true
                      activeGestureInterceptor: true,
                      //If you don't pass progressBarColor, the color of defaultLoadingProgressBar will be grey.
                      //You can set your custom color or use [Colors.transparent] for hiding loadingProgressBar.
                      progressBarColor: AppColors.primary,
                      //You can disable viewer touch response by setting 'enableTouch' to 'false'
                      enableTouch: true,
                      //This callBack will return the loading progress value between 0 and 1.0
                      onProgress: (double progressValue) {
                        debugPrint('model loading progress : $progressValue');
                      },
                      //This callBack will call after model loaded successfully and will return model address
                      onLoad: (String modelAddress) {
                        debugPrint('model loaded : $modelAddress');
                      },
                      //this callBack will call when model failed to load and will return failure error
                      onError: (String error) {
                        debugPrint('model failed to load : $error');
                      },
                      //You can have full control of 3d model animations, textures and camera
                      controller: controller,
                      src:
                          'assets/glb/ISS_stationary.glb', //3D model with different animations
                      //src: 'assets/sheen_chair.glb', //3D model with different textures
                      //src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb', // 3D model from URL
                    ),
                  ),
                );
              // } else {
                // ref.read(issLocationRepository);
                // return child!;
              // }
            },
            child: const Loader(),
          ),
          //     Button(
          //   size: ButtonSize.m,
          //   text: localizations.homeLogout,
          //   onPressed: () => ref.read(logoutProvider.future).then(
          //         (_) => Navigator.of(context).pushNamedAndRemoveUntil(
          //           AppRoutes.login,
          //           (_) => false,
          //         ),
          //       ),
          // ),
        ],
      ),
    );
  }
}
