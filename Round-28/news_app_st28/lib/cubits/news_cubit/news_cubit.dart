import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_st28/model/news_model.dart';
import 'package:news_app_st28/repository/new_repo.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  final _newsRepo = NewsRepo();

  void getNews() async {
    try {
      emit(NewsLoading());
      final res = await _newsRepo.fetchNews();
      final model = NewsGeneralResponse.fromJson(res.data);
      emit(NewsSuccess(model));
    } catch (e) {
      emit(NewsFailed());
    }
  }
}
