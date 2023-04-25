import 'package:flutter/material.dart';
import 'package:limitless.chat_admin/Configs/NumberLimits.dart';

myCliprectLogo(Widget widget) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(Numberlimits.defaultclipradius),
      child: widget);
}
