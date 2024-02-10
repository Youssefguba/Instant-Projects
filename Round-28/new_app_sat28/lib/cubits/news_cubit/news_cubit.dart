import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:new_app_sat28/models/news_model.dart';
import 'package:new_app_sat28/repository/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  NewsGeneralResponse? news;

  void getNews() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.none) {
      emit(NewsNoInternetConnection());
    }

    try {
      emit(NewsLoading());

      news = await NewsRepository().getTopBusinessNews();
      emit(NewsSuccess(news!));
    } catch (e) {
      if(news == null) {
        emit(NewsFailed());
      } else {
        emit(NewsSuccess(news!));
      }
    }
  }
}
