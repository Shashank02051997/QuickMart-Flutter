class UpdateProfilePostBodyModel {
  UpdateProfilePostBodyModel({
    this.firstname,
    this.lastname,
    this.email,
    this.dob,
    this.gender,
    this.about,
    this.profilePic,
    this.address,
  });

  final String? firstname;
  final String? lastname;
  final String? email;
  final String? dob;
  final String? gender;
  final String? about;
  final String? profilePic;
  final String? address;

  factory UpdateProfilePostBodyModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfilePostBodyModel(
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      dob: json["dob"],
      gender: json["gender"],
      about: json["about"],
      profilePic: json["profile_pic"],
      address: json["address"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (firstname != null) data['firstname'] = firstname;
    if (lastname != null) data['lastname'] = lastname;
    if (email != null) data['email'] = email;
    if (dob != null) data['dob'] = dob;
    if (gender != null) data['gender'] = gender;
    if (about != null) data['about'] = about;
    if (profilePic != null) data['profile_pic'] = profilePic;
    if (address != null) data['address'] = address;

    return data;
  }
}
