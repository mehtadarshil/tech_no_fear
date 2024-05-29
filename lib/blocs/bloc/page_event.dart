part of 'page_bloc.dart';

@immutable
sealed class PageEvent {}

final class PageChangeEvent extends PageEvent {
  final int newPage;

  PageChangeEvent({required this.newPage});
}
