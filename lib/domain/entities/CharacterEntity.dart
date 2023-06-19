import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable{

 final String name;
 final String image;
 final String status;
 final String gender;
 final String origin;
 final String location;

  const CharacterEntity(this.name, this.image, this.status, this.gender, this.origin, this.location);


  @override
  List<Object?> get props => [
    name,
    image,
    status,
    gender,
    origin,
    location
  ];

}
