import "dart:async";

import "package:flutter_map/flutter_map.dart";
import "package:latlong2/latlong.dart";
import "package:url_launcher/url_launcher.dart";
import "package:wheniss/data/models/iss_location.dart";
import "package:wheniss/data/repository/iss/iss_repository.dart";
import "package:wheniss/services/app_colors.dart";
import "package:wheniss/ui/shared/app_scaffold.dart";
import "package:wheniss/ui/shared/loader.dart";
import "package:wheniss/ui/view_model/iss_view_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(final BuildContext context) {
    final MapController mapController = MapController();
    return AppScaffold(
      appBar: false,
      tabIndex: 0,
      body: Consumer(
        builder: (_, final WidgetRef ref, final Widget? child) {
          final IssLocation? issLocation = ref.watch(issLocationProvider);

          if (issLocation == null) {
            ref.read(issLocationRepository);
          }

          Timer.periodic(Duration(seconds: 10), (Timer t) {
            // ignore: unused_result
            ref.refresh(issLocationRepository);
          });

          return issLocation == null
              ? child!
              : Stack(
                  children: [
                    FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                        initialCenter: LatLng(
                          issLocation.latitude,
                          issLocation.longitude,
                        ), // Center the map over Montpellier
                        initialZoom: 4,
                      ),
                      children: [
                        TileLayer(
                          // Display map tiles from any source
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
                          userAgentPackageName: 'com.somatech.app',
                          // And many more recommended properties!
                        ),
                        ...[
                          CircleLayer(
                            circles: [
                              CircleMarker(
                                point: LatLng(
                                  issLocation.latitude,
                                  issLocation.longitude,
                                ),
                                color: AppColors.primary.withOpacity(0.1),
                                borderStrokeWidth: 1,
                                borderColor: AppColors.primary,
                                radius: 1200000,
                                useRadiusInMeter: true,
                              ),
                            ],
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: LatLng(
                                  issLocation.latitude,
                                  issLocation.longitude,
                                ),
                                width: 64,
                                height: 64,
                                child: Image.asset(
                                  "assets/images/logo-iss.png",
                                  width: 128,
                                  height: 128,
                                ),
                              ),
                            ],
                          ),
                          RichAttributionWidget(
                            // Include a stylish prebuilt attribution widget that meets all requirments
                            attributions: [
                              TextSourceAttribution(
                                'OpenStreetMap contributors',
                                onTap: () => launchUrl(Uri.parse(
                                  'https://openstreetmap.org/copyright',
                                )), // (external)
                              ),
                              // Also add images...
                            ],
                          ),
                        ],
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ISS Location | Latitude: ${issLocation.latitude} | Longitude: ${issLocation.longitude}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaler: TextScaler.linear(0.6),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
        child: const Loader(color: AppColors.primary, radius: 32),
      ),
    );
  }
}
