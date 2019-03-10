class JsonModel {
  // Create Field
  int id;
  String name, user, password;

  // Constructor
  // JsonModel(
  //     int idInt, String nameString, String userSting, String passwordSting) {
  //   id = idInt;
  //   name = nameString;
  //   user = userSting;
  //   password = passwordSting;
  // }

  JsonModel(this.id, this.name, this.user, this.password);

  JsonModel.fromJson(Map<String, dynamic> parseJSON) {
    id = int.parse(parseJSON['id']);
    name = parseJSON['Name'];
    user = parseJSON['User'];
    password = parseJSON['Password'];
  }
}
