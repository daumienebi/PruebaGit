//import 'dart:html';

import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';
//import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:latlong2/latlong.dart';
import 'package:pruebapc/estilos/mis_estilos.dart';
//import 'package:latlong2/latlong.dart';
//import 'package:flutter_map/plugin_api.dart';
//osm

class MiMapa extends StatelessWidget {
  
  const MiMapa({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

   
    return Container(
      //aqui no hace falta un appBar
       child: _mostrarMiMapaOSM(context)

    );
  }

/*
OpenStreetMapTileProviderConstants.setCachePath(this.getFilesDir().getAbsolutePath());
urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
  Widget _mostrarMiMapaFlutterMap(){

    return FlutterMap(
      mapController: MapController(
        
      ),
       options: MapOptions(
         
         //center: LatLng(27.1751, 50.0421),
        zoom: 15.0,

        
      ), 
      layers: [
        MarkerLayerOptions(
          
        ),
        
        TileLayerOptions(
          
          minZoom: 1,
          maxZoom: 18,
          backgroundColor: Colors.white24,
          
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          //urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
          
        ),
      ],        
      );
  }
*/
  Widget _mostrarMiMapaOSM(context){
   var controller = MapController(
            
            initMapWithUserPosition: true,
            initPosition: GeoPoint(latitude: 40.416775, longitude: -3.703790),
            areaLimit: BoundingBox( east: 10.4922941, north: 40.4637, south: 45.817995, west: 3.7492,),
            
          );
    final double myLoc;
     
  return InkWell(
    onTap: ()async{
        await controller.addMarker(GeoPoint(latitude: 40.416775, longitude: -3.703790 ),
        markerIcon:MarkerIcon(icon: Icon(Icons.location_on,color: Colors.red,),),angle:pi/3);
        //print(controller.bounds);
    },
    child: OSMFlutter( 
      
          controller:controller,
          mapIsLoading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
            CircularProgressIndicator(),
            Text("Cargando Mapa")
          ],),
          /*
          onGeoPointClicked: (p0) =>MarkerIcon(
            icon: Icon(Icons.location_on,color: Colors.red,),
            
          ),*/ //Marker(point: LatLng(40.5433,45.7754), builder: context),
          trackMyPosition: false,
          initZoom: 12,
          minZoomLevel: 15,
          maxZoomLevel: 17,
          stepZoom: 2.0,
          
          userLocationMarker: MisEstilos.MiUserLocationMaker(),
          
          roadConfiguration: MisEstilos.MiRoadConfiguration(),
          markerOption:  MisEstilos.MiMarkerOption(),
      ),
  );
    
  }

  void obtenerUbicacion(controller) async{
    
     GeoPoint point = await controller.myLocation();
     //return point;
  }

  void quitarMarcador(controller,geoPoint) async{
    await controller.removeMarker(geoPoint);
  }

  void addMarcador(controller) async{
    await controller.addMarker(GeoPoint,markerIcon:MarkerIcon,angle:pi/3);
  }

}