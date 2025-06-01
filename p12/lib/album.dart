class Album {
  final int userld;
  final int id;
  final String title;
  const Album({required this.userld, required this.id, required this.title});
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(userld: json['userld'], id: json['id'], title: json['title']);
  }
}
