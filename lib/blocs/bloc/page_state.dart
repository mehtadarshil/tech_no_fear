part of 'page_bloc.dart';

@immutable
sealed class PageState {}

final class PageInitial extends PageState {}

final class PageData extends PageState {
  final int currentPage;

  PageData({required this.currentPage});
}
