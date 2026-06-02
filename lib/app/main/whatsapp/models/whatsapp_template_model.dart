import 'whatsapp_template_type.dart';

class WhatsAppTemplateModel {
  WhatsAppTemplateModel({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.isActive,
    required this.isDefault,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String body;
  final WhatsAppTemplateType type;
  final bool isActive;
  final bool isDefault;
  final DateTime updatedAt;

  WhatsAppTemplateModel copyWith({
    String? title,
    String? body,
    WhatsAppTemplateType? type,
    bool? isActive,
    bool? isDefault,
    DateTime? updatedAt,
  }) {
    return WhatsAppTemplateModel(
      id: id,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      isActive: isActive ?? this.isActive,
      isDefault: isDefault ?? this.isDefault,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
