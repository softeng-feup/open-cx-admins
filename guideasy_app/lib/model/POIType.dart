

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guideasy_app/view/icons/guideasy_icons_icons.dart';

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
      return GuideasyIcons.room;
    case POIType.STAIRS:
      return GuideasyIcons.female;
      break;
    case POIType.ELEVATOR:
      return GuideasyIcons.elevator;
      break;
    case POIType.WC:
      return GuideasyIcons.male;
      break;
    case POIType.RECEPTION:
      return GuideasyIcons.concierge_bell_solid;
      break;
    case POIType.LOST_AND_FOUND:
      return GuideasyIcons.lostandfound;
      break;
    case POIType.SNACK_BAR:
      return GuideasyIcons.wheelchair;
      break;
    case POIType.COFFEE_BREAK:
      return GuideasyIcons.coffee;
      break;
    case POIType.VENDING_MACHINE:
      return GuideasyIcons.vending_machine;
      break;
    case POIType.UNDEFINED:
      return Icons.help;
      break;
    default:
      return Icons.help;
  }
}