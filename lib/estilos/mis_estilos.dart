import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MisEstilos{

static UserLocationMaker MiUserLocationMaker(){
  final UserLocationMaker miUserLocationMarker = UserLocationMaker(
            personMarker:  MarkerIcon(
                icon: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                ),
            ),
            directionArrowMarker:  MarkerIcon(
                icon: Icon(
                    Icons.arrow_forward,
                    size: 48,
                ),
            ),
        );
        return miUserLocationMarker;
}

static RoadConfiguration MiRoadConfiguration(){
 final RoadConfiguration miRoadConfiguration = RoadConfiguration(
                startIcon:  MarkerIcon(
                  icon: Icon(
                    Icons.person,
                    size: 64,
                    color: Colors.brown,
                  ),
                ),
                roadColor: Colors.yellowAccent,
        );
        return miRoadConfiguration;
}

static MarkerOption MiMarkerOption(){
  final MarkerOption miMarkerOption = MarkerOption(
            defaultMarker:  MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 56,
                  ),
                )
        );
        return miMarkerOption;
}
}