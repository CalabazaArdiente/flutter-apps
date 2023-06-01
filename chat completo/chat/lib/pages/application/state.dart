import 'package:get/get_rx/get_rx.dart';

class ApplicationState {
  final _page = 0.obs;
  int get page => _page.value;
  set page(value) => _page.value = value;
}
