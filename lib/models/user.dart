import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(createToJson: false)
class User extends Equatable {
  final int id;
  final String username;
  final String? avatarUrl;
  const User({
    required this.id,
    required this.username,
    this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  List<Object?> get props => [id, username, avatarUrl];
}
