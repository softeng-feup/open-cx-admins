

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO decide on better POIs
enum POIType {
  STAIRS,
  ELEVATOR,
  WC,
  RECEPTION,
  LOST_AND_FOUND,
  SNACK_BAR,
  COFFEE_BREAK,
  VENDING_MACHINE,
  ROOM,
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
    case 'wc':
      return POIType.WC;
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
      break;
    case POIType.ELEVATOR:
      return Icons.unfold_more;
      break;
    case POIType.WC:
      return Icons.wc;
      break;
    case POIType.RECEPTION:
      return Icons.room_service;
      break;
    case POIType.LOST_AND_FOUND:
      return Icons.find_in_page;
      break;
    case POIType.SNACK_BAR:
      return Icons.restaurant;
      break;
    case POIType.COFFEE_BREAK:
      return Icons.local_cafe;
      break;
    case POIType.VENDING_MACHINE:
      return Icons.kitchen;
      break;
    case POIType.UNDEFINED:
      return Icons.help;
      break;
    default:
      return Icons.help;
  }
}