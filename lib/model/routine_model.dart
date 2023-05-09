/*
{
    "routine_id": "3213321xdsd",
    "uid": "12",
    "routine_categorie": "fitness",
    "routine_start": "23",
    "routine_end": "25",
    "routine_content": "djskahdjkas"
}
 */

class RoutineModel {
  String? routineId;
  String? uid;
  String? routineCategorie;
  String? routineStart;
  String? routineEnd;
  String? routineContent;

  RoutineModel(
      {this.routineId,
      this.uid,
      this.routineCategorie,
      this.routineStart,
      this.routineEnd,
      this.routineContent});

  RoutineModel.fromJson(Map<String, dynamic> json) {
    routineId = json['routine_id'];
    uid = json['uid'];
    routineCategorie = json['routine_categorie'];
    routineStart = json['routine_start'];
    routineEnd = json['routine_end'];
    routineContent = json['routine_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['routine_id'] = this.routineId;
    data['uid'] = this.uid;
    data['routine_categorie'] = this.routineCategorie;
    data['routine_start'] = this.routineStart;
    data['routine_end'] = this.routineEnd;
    data['routine_content'] = this.routineContent;
    return data;
  }
}
