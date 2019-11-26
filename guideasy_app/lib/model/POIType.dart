

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO decide on better POIs
enum POIType {
  STAIRS,
  ELEVATOR,
  MALE_WC,
  FEMALE_WC,
  ACCESS_WC,
  RECEPTION,
  LOST_AND_FOUND,
  SNACK_BAR,
  COFFEE_BREAK,
  VENDING_MACHINE,
  ROOM,
  PARKING,
  UNDEFINED
}

POIType stringToPOIType(String type) {
  switch(type) {
    case 'room':
      return POIType.ROOM;
    case 'stairs':
      return POIType.STAIRS;
    case 'elevator':
      return POIType.ELEVATOR;
    case 'male wc':
      return POIType.MALE_WC;
    case 'female wc':
      return POIType.FEMALE_WC;
    case 'accessible wc':
      return POIType.ACCESS_WC;
    case 'reception':
      return POIType.RECEPTION;
    case 'lost and found':
      return POIType.LOST_AND_FOUND;
    case 'snack bar':
      return POIType.SNACK_BAR;
    case 'coffee break':
      return POIType.COFFEE_BREAK;
    case 'vending machine':
      return POIType.VENDING_MACHINE;
    case 'parking':
      return POIType.PARKING;
    default:
      return POIType.UNDEFINED;
  }
}

IconData poiTypeIcon(POIType type) {
  switch(type) {
    case POIType.ROOM:
      return Icons.room;
    case POIType.STAIRS:
      return Icons.show_chart;
    case POIType.ELEVATOR:
      return Icons.unfold_more;
    case POIType.MALE_WC:
      return Icons.wc;
    case POIType.FEMALE_WC:
      return Icons.wc;
    case POIType.ACCESS_WC:
      return Icons.wc;
    case POIType.RECEPTION:
      return Icons.room_service;
    case POIType.LOST_AND_FOUND:
      return Icons.find_in_page;
    case POIType.SNACK_BAR:
      return Icons.restaurant;
    case POIType.COFFEE_BREAK:
      return Icons.local_cafe;
    case POIType.VENDING_MACHINE:
      return Icons.kitchen;
    case POIType.PARKING:
      return Icons.local_parking;
    case POIType.UNDEFINED:
      return Icons.help;
    default:
      return Icons.help;
  }
}