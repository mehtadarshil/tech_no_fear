import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageData> {
  PageBloc() : super(PageData(currentPage: 0)) {
    on<PageChangeEvent>((event, emit) {
      emit(PageData(currentPage: event.newPage));
    });
  }
}
