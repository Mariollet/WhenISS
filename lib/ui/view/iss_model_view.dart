import "package:wheniss/services/app_colors.dart";
import "package:wheniss/services/stary_sky_painter.dart";
import "package:wheniss/ui/shared/app_scaffold.dart";
import "package:wheniss/ui/shared/loader.dart";
import "package:flutter/material.dart";
import "package:flutter_3d_controller/flutter_3d_controller.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ISSModelView extends StatefulWidget {
  const ISSModelView({super.key});

  @override
  State<ISSModelView> createState() => _ISSViewState();
}

class _ISSViewState extends State<ISSModelView> {
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
  void dispose() {
    controller.onModelLoaded.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      appBar: false,
      tabIndex: 2,
      body: Consumer(
        builder: (_, final WidgetRef ref, final Widget? child) {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.94,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: CustomPaint(
              size: Size.infinite,
              painter: StarrySkyPainter(
                starCount: 300, // Adjust the number of stars
                starColor: const Color.fromARGB(
                    235, 255, 255, 255), // Color of the stars
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
        },
        child: const Loader(),
      ),
    );
  }
}
