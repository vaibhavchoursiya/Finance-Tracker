abstract class ChangeScreenEvent {}

class ChangeScreen extends ChangeScreenEvent {
  final int currentIndex;

  ChangeScreen({required this.currentIndex});
}
