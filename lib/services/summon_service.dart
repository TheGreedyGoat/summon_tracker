import 'package:summon_tracker/models/summon_template.dart';
import 'package:summon_tracker/notifiers/edit_template_notifier.dart';

class SummonService {
  //TODO replace with database
  static final List<SummonTemplate> _templates = List.empty(growable: true);

  const SummonService._();
  static const SummonService instance = SummonService._();

  SummonTemplate? getTemplateByID(String tID) {
    try {
      return _templates.firstWhere(
        (template) => template.id == tID,
      );
    } catch (e) {
      print('not found');
    }
  }

  SummonService.saveTemplate(SummonTemplate template) {
    final index = _templates.indexWhere(
      (t) => t.id == template.id,
    );

    if (index < 0) {
      _templates.add(template);
    } else {
      _templates[index] = template;
    }
  }
}
