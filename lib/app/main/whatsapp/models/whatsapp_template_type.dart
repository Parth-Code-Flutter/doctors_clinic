enum WhatsAppTemplateType { reminder, followUp, receipt, custom }

extension WhatsAppTemplateTypeX on WhatsAppTemplateType {
  String get storageValue {
    switch (this) {
      case WhatsAppTemplateType.reminder:
        return 'reminder';
      case WhatsAppTemplateType.followUp:
        return 'follow_up';
      case WhatsAppTemplateType.receipt:
        return 'receipt';
      case WhatsAppTemplateType.custom:
        return 'custom';
    }
  }
}
