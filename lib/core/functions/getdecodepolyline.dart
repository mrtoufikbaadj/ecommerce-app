import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getPolyline(lat, long, destlat, destlong) async {
  String keyGoogleMap = "";
  Set<Polyline> plylineSet = {};
  List<LatLng> polylinecor = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=$keyGoogleMap";

  var resp = await http.post(Uri.parse(url));
  var respbody = jsonDecode(resp.body);
  var point = respbody['routes'][0]['overview_polyline']['points'];

  List<PointLatLng> result = polylinePoints.decodePolyline(point);

  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLong) {
      polylinecor.add(LatLng(pointLatLong.latitude, pointLatLong.longitude));
    });
  }

  Polyline polyline = Polyline(
      polylineId: PolylineId("idPolyline"),
      color: Colors.blue,
      width: 5,
      points: polylinecor);

  plylineSet.add(polyline);

  return plylineSet;
}
