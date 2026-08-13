import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/notifiers/fab_notifier.dart';
import 'package:summon_tracker/views/pages/template_edit/edit_page_0.dart';
import 'package:summon_tracker/views/pages/template_edit/edit_page_1.dart';
import 'package:summon_tracker/views/pages/template_edit/edit_page_2.dart';

class TemplateEditPageView extends ConsumerStatefulWidget {
  const TemplateEditPageView({super.key});

  @override
  ConsumerState<TemplateEditPageView> createState() =>
      _TemplateEditPageViewState();
}

class _TemplateEditPageViewState extends ConsumerState<TemplateEditPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final List<Widget> pages = [EditPage0(), EditPage1(), EditPage2()];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(fabProvider.notifier)
          .set(
            FabState(
              onPressed: () {
                _globalKey.currentState?.validate();
              },
              icon: Icons.save,
              child: FabState(
                onPressed: () {},
                icon: CupertinoIcons.textformat_abc,
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  ElevatedButton(onPressed: () {}, child: Icon(Icons.save)),
                  ElevatedButton(
                    onPressed: () {},
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
                        onPressed: () => _pageController.jumpToPage(i),
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
}
