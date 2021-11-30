import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class BabyModel extends Equatable {
  final String id;
  final String gender;
  final String name;
  final String idAccount;
  final DateTime birth;
  final String image; //DateTime

  BabyModel(
      {this.id,
      this.gender,
      this.name,
      this.idAccount,
      this.birth,
      this.image});

  static BabyModel fromSnapshot(DocumentSnapshot snap) {
    DateTime myDateTime = snap['birth'].toDate();
    BabyModel babyModel = BabyModel(
      id: snap.id,
      gender: snap['gender'],
      name: snap['name'],
      idAccount: snap['idAccount'],
      birth: myDateTime,
      image: snap['image'],
    );
    return babyModel;
  }

  @override
  List<Object> get props => [
        id,
        gender,
        name,
        idAccount,
        birth,
        image,
      ];

  Map<String, Object> toJson() {
    Timestamp myTimeStamp = Timestamp.fromDate(birth);
    return {
      "name": name,
      "gender": gender,
      "idAccount": idAccount,
      "birth": myTimeStamp,
      "image": image,
    };
  }
}
