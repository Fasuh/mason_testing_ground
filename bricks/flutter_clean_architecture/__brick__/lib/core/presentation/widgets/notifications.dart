import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name}}/core/error/failures.dart';
import 'package:{{project_name}}/core/style/colors.dart';
import 'package:{{project_name}}/core/style/dimens.dart';
import 'package:{{project_name}}/core/style/duration.dart';
import 'package:{{project_name}}/core/style/text_styles.dart';

void notification({required String description, Color backgroundColor = blackColor}) => BotToast.showNotification(
      title: (_) => Text(
        description,
        style: roboto.s16.colorWhite.h13,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: backgroundColor.withOpacity(0.8),
      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
      borderRadius: buttonRadius,
      duration: notificationDuration,
    );

void errorNotification({required Failure failure, Color backgroundColor = blackColor}) => notification(
  description: failure.errorMessage,
  backgroundColor: backgroundColor,
);
