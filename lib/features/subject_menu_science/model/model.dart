class ScienceData {
  // ScienceData({
  //   required this.status,
  //   this.message,
  //   this.errors,
  //   required this.data,
  // });
  late final bool status;
  late final Null message;
  late final Null errors;
  late final List<ScienceModel> data;

  ScienceData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = null;
    errors = null;
    data = List.from(json['data'] ?? []).map((e)=>ScienceModel.fromJson(e)).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['status'] = status;
  //   _data['message'] = message;
  //   _data['errors'] = errors;
  //   _data['data'] = data.map((e)=>e.toJson()).toList();
  //   return _data;
  // }
}

class ScienceModel {
  // Data({
  //   required this.id,
  //   required this.name,
  //   required this.stageId,
  //   required this.classroomId,
  //   required this.termId,
  //   required this.subjectId,
  //   required this.createdAt,
  //   required this.lessons,
  // });
  late final int id;
  late final String name;
  late final int stageId;
  late final int classroomId;
  late final int termId;
  late final int subjectId;
  late final String createdAt;
  late final List<Lessons> lessons;

  ScienceModel.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    stageId = json['stage_id'] ?? 0;
    classroomId = json['classroom_id'] ?? 0;
    termId = json['term_id'] ?? 0;
    subjectId = json['subject_id'] ?? 0;
    createdAt = json['created_at'] ?? "";
    lessons = List.from(json['lessons'] ?? []).map((e)=>Lessons.fromJson(e)).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['id'] = id;
  //   _data['name'] = name;
  //   _data['stage_id'] = stageId;
  //   _data['classroom_id'] = classroomId;
  //   _data['term_id'] = termId;
  //   _data['subject_id'] = subjectId;
  //   _data['created_at'] = createdAt;
  //   _data['lessons'] = lessons.map((e)=>e.toJson()).toList();
  //   return _data;
  // }
}

class Lessons {
  // Lessons({
  //   required this.id,
  //   required this.name,
  //   this.img,
  //   required this.skipPoint,
  //   this.description,
  //   required this.stageId,
  //   required this.classroomId,
  //   required this.termId,
  //   required this.subjectId,
  //   required this.unitId,
  //   required this.createdAt,
  //   required this.updatedAt,
  //   this.childAnswersPoint,
  //   this.entry,
  // });
  late final int id;
  late final String name;
  late final Null img;
  late final int skipPoint;
  late final Null description;
  late final int stageId;
  late final int classroomId;
  late final int termId;
  late final int subjectId;
  late final int unitId;
  late final String createdAt;
  late final String updatedAt;
  late final int? childAnswersPoint;
  // late final Entry? entry;

  Lessons.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    img = null;
    skipPoint = json['skip_point'] ?? 0;
    description = null;
    stageId = json['stage_id'] ?? 0;
    classroomId = json['classroom_id'] ?? 0;
    termId = json['term_id'] ?? 0;
    subjectId = json['subject_id'] ?? 0;
    unitId = json['unit_id'] ?? 0;
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    childAnswersPoint = null;
    // entry = null;
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['id'] = id;
  //   _data['name'] = name;
  //   _data['img'] = img;
  //   _data['skip_point'] = skipPoint;
  //   _data['description'] = description;
  //   _data['stage_id'] = stageId;
  //   _data['classroom_id'] = classroomId;
  //   _data['term_id'] = termId;
  //   _data['subject_id'] = subjectId;
  //   _data['unit_id'] = unitId;
  //   _data['created_at'] = createdAt;
  //   _data['updated_at'] = updatedAt;
  //   _data['child_answers_point'] = childAnswersPoint;
  //   _data['entry'] = entry;
  //   return _data;
  // }
}

// class Entry {
//   // Entry({
//   //   required this.number,
//   //   required this.childId,
//   //   required this.lessonId,
//   // });
//   late final int number;
//   late final int childId;
//   late final int lessonId;
//
//   Entry.fromJson(Map<String, dynamic> json){
//     number = json['number'] ?? 0;
//     childId = json['child_id'] ?? 0;
//     lessonId = json['lesson_id'] ?? 0;
//   }
//
// Map<String, dynamic> toJson() {
//   final _data = <String, dynamic>{};
//   _data['number'] = number;
//   _data['child_id'] = childId;
//   _data['lesson_id'] = lessonId;
//   return _data;
// }
// }