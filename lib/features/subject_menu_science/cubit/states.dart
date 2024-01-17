import '../model/model.dart';

class ScienceDataStates {}

class GetDataLoading extends ScienceDataStates {}

class GetDataSuccess extends ScienceDataStates {
  final List<ScienceModel> data;

  GetDataSuccess({required this.data});
}

class GetDataFailed extends ScienceDataStates {}
