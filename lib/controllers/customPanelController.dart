import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomPanelController {
  PanelController panelController;

  StreamController<bool> _panelEventsController;
  Stream<bool> panelEvents;

  StreamController<Widget> panelContentController;
  Stream<Widget> panelContent;

  CustomPanelController(this.panelController) {
    _panelEventsController = StreamController<bool>();
    panelEvents = _panelEventsController.stream;

    panelContentController = StreamController<Widget>();
    panelContent = panelContentController.stream;
  }

  void hidePanel() async {
    if (!panelController.isAttached) return;
    await panelController.hide();
  }

  void showPanel() async {
    if (!panelController.isAttached) return;
    await panelController.show();
  }

  void togglePanelVisibility() async {
    if (!panelController.isAttached) return;
    if (panelController.isPanelShown)
      await panelController.hide();
    else
      await panelController.show();
  }

  void closePanel() async {
    if (!panelController.isAttached) return;
    await panelController.close();
  }

  void openPanel() async {
    if (!panelController.isAttached) return;
    await panelController.show();
    await panelController.open();
  }

  void togglePanel() async {
    if (!panelController.isAttached) return;
    if (panelController.isPanelOpen)
      await panelController.close();
    else if (panelController.isPanelClosed) await panelController.open();
  }

  void updateStream({@required bool isPanelOpen}) {
    _panelEventsController.add(isPanelOpen);
  }
}
