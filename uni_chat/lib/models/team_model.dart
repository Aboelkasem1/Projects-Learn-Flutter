class TeamModel {
  final String id;
  final String name;
  final String creatorId;
  final List<String> members;

  TeamModel({
    required this.id,
    required this.name,
    required this.creatorId,
    required this.members,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      id: json['id'],
      name: json['name'],
      creatorId: json['creatorId'],
      members: List<String>.from(json['members']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'creatorId': creatorId,
      'members': members,
    };
  }
}
