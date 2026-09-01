import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/logic/models/summons/summon_master.dart';
import 'package:summon_tracker/logic/notifiers/change_notifier.dart';
import 'package:summon_tracker/logic/notifiers/edit_variant_notifier.dart';
import 'package:summon_tracker/logic/services/database/database_service.dart';
import 'package:summon_tracker/views/pages/variant_edit/edit_page_0.dart';
import 'package:summon_tracker/views/pages/variant_edit/edit_page_1.dart';
import 'package:summon_tracker/views/pages/variant_edit/edit_page_2.dart';
import 'package:summon_tracker/views/pages/variant_edit/variant_vars_page.dart';
import 'package:summon_tracker/widget_tree.dart';

/// The parent widget to create a new or edit an existing smmon template.
///
///
class VariantEditPageView extends ConsumerStatefulWidget {
  final SummonMaster master;
  final int? variantIndex;
  const VariantEditPageView({
    required this.master,
    this.variantIndex,
    super.key,
  });

  @override
  ConsumerState<VariantEditPageView> createState() =>
      _VariantEditPageViewState();
}

class _VariantEditPageViewState extends ConsumerState<VariantEditPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final List<Widget> pages = [EditPage0(), EditPage1(), EditPage2()];

  void _onSavePressed(EditVariantState state) async {
    if (!(_globalKey.currentState?.validate() ?? false)) {
      return;
    }
    String? variableCheck = state.validateVariables();
    if (variableCheck != null) {
      _toVariables();
      unawaited(
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(variableCheck),
          ),
        ),
      );
      return;
    }

    try {
      final errorMessage = await DatabaseService.instance.insertMaster(
        widget.master,
      );
      if (errorMessage != null) {
        print('Error ocuured while saving: $errorMessage');
        return;
      }
      final variant = state.toVariant(widget.master);
      if (variant != null) {
        await DatabaseService.instance.insertVariant(variant);
      }
      ref.read(refChanges.notifier).masterChanged();
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editVariantProvider);
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.blueAccent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                spacing: 8.0,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () => _onSavePressed(state),
                    child: Icon(Icons.save),
                  ),
                  ElevatedButton(
                    onPressed: () => _toVariables(),
                    child: Icon(CupertinoIcons.textformat_abc_dottedunderline),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < pages.length; i++)
                    Center(
                      child: ElevatedButton(
                        onPressed: () => _pageController.animateToPage(
                          i,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                        //  _pageController.jumpToPage(i),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _currentPage == i
                              ? Colors.tealAccent
                              : Colors.teal,
                        ),
                        child: Text('Seite $i'),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Form(
            key: _globalKey,
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) => setPage(value),
              children: pages
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void setPage(int value) {
    setState(() {
      _currentPage = value;
    });
  }

  void _toVariables() {
    Navigator.of(
      context,
    ).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Edit Variables'),
          ),
          body: VariantVarsPage(),
        ),
      ),
    );
  }
}
