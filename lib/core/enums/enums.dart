import 'package:flutter/material.dart';

import '../components/chip.dart';

enum ResourceType { tech_team, support_agent }

enum TurkcellServiceEnum {
  turkcellMobile,
  paycell,
  tvPlus,
  fizy,
  superonline,
  bip,
}

extension TurkcellServiceExtension on TurkcellServiceEnum {
  String get title {
    switch (this) {
      case TurkcellServiceEnum.bip:
        return 'BiP';
      case TurkcellServiceEnum.turkcellMobile:
        return 'Turkcell Mobile';
      case TurkcellServiceEnum.paycell:
        return 'Paycell';
      case TurkcellServiceEnum.tvPlus:
        return 'TV+';
      case TurkcellServiceEnum.fizy:
        return 'Fizy';
      case TurkcellServiceEnum.superonline:
        return 'Superonline';
    }
  }
}

enum RequestEnum {
  billingDispute('BILLING_DISPUTE'),
  balanceError('BALANCE_ERROR'),
  loginProblem('LOGIN_PROBLEM'),
  subscriptionProblem('SUBSCRIPTION_PROBLEM'),
  packageIssue('PACKAGE_ISSUE'),
  playbackError('PLAYBACK_ERROR'),
  streamingIssue('STREAMING_ISSUE'),
  modemFault('MODEM_FAULT'),
  coverageProblem('COVERAGE_PROBLEM'),
  messageDelivery('MESSAGE_DELIVERY'),
  notificationIssue('NOTIFICATION_ISSUE'),
  connectionIssue('CONNECTION_ISSUE'),
  paymentProblem('PAYMENT_PROBLEM'),
  speedComplaint('SPEED_COMPLAINT');

  final String value;
  const RequestEnum(this.value);
}

enum RequestChannelEnum {
  web('Web'),
  socialMedia('Social Media'),
  mobileApp('Mobile App'),
  callCenter('Call Center');

  final String value;
  const RequestChannelEnum(this.value);
}

enum UrgencyEnum {
  low('LOW'),
  medium('MEDIUM'),
  high('HIGH');

  final String value;
  const UrgencyEnum(this.value);
}

extension UrgencyEnumExtension on UrgencyEnum {
  Widget widgetWithTitle(String title) => BaseChip(
    type: ColorType.filledWarning,
    title: title,
    size: ChipSize.smallChip,
  );
}

enum AllocationStatus {
  waiting('WAITING'),
  assigned('ASSIGNED');

  final String value;
  const AllocationStatus(this.value);
}

// Hangi alanlar üzerinden kural tanımlanabileceğini belirleyen enum
enum AllocationField {
  urgency,
  service;

  @override
  String toString() => name;
}
