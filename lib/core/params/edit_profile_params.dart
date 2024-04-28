import 'dart:io';

class EditProfileParams{
  final int phoneNumber;
  final String address;
  final File photo;

  EditProfileParams({required this.phoneNumber, required this.address, required this.photo});



  Map<String,dynamic> toJson()=>{

  };
}