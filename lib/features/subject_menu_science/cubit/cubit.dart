import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeema_task/core/logic/dio_helper.dart';

import '../model/model.dart';
import 'states.dart';

class ScienceSubject extends Cubit<ScienceDataStates> {
  ScienceSubject() : super(ScienceDataStates());

  Future<void> getData() async {
    print("_________--------");
    emit(
      GetDataLoading(),
    );

    final response = await DioHelper().sendToServer(
      url: "lessons",
    );
    if (response.success) {
      final list = ScienceData.fromJson(response.response!.data);
      print(response.response!.data,);
      emit(
        GetDataSuccess(
          data: list.data,
        ),
      );
    } else {
      print(response.response!,);
      emit(
        GetDataFailed(),
      );
    }
  }
}
