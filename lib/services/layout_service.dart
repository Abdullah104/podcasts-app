import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@lazySingleton
class LayoutService {
  late PageController _globalPageController;
  PageController get globalPageController => _globalPageController;

  late PanelController _globalPanelController;
  PanelController get globalPanelController => _globalPanelController;

  LayoutService() {
    _initGlobalPanel();
    _initGlobalPage();
  }

  void _initGlobalPanel() => _globalPanelController = PanelController();

  void _initGlobalPage() => _globalPageController = PageController();
}
