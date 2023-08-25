class Note {
  final int? id;
  final String email;
  final String password;

  const Note({required this.email, required this.password, this.id});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    email: json['email'],
    password: json['password'],
    id: json['id'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'password': password,
  };
}
