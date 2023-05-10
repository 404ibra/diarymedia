/*
{
    "routine_id": "3213321xdsd",
    "uid": "12",
    "routine_categorie": "fitness",
    "routine_start": "23",
    "routine_end": "25",
    "routine_content": "djskahdjkas",
    "routine_cover_image_path": ""
}
 */

class RoutineModel {
  String? routineId;
  String? uid;
  String? routineCategorie;
  String? routineStart;
  String? routineEnd;
  String? routineContent;
  String? routineCoverImagePath;

  RoutineModel(
      {this.routineId,
      this.uid,
      this.routineCategorie,
      this.routineStart,
      this.routineEnd,
      this.routineContent,
      this.routineCoverImagePath});

  RoutineModel.fromJson(Map<String, dynamic> json) {
    routineId = json['routine_id'];
    uid = json['uid'];
    routineCategorie = json['routine_categorie'];
    routineStart = json['routine_start'];
    routineEnd = json['routine_end'];
    routineContent = json['routine_content'];
    routineCoverImagePath = json['routine_cover_image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['routine_id'] = this.routineId;
    data['uid'] = this.uid;
    data['routine_categorie'] = this.routineCategorie;
    data['routine_start'] = this.routineStart;
    data['routine_end'] = this.routineEnd;
    data['routine_content'] = this.routineContent;
    data['routine_cover_image_path'] = this.routineCoverImagePath;
    return data;
  }
}
