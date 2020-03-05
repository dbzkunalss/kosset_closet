// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 1;

  @override
  User read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      cycle: fields[8] as int,
      days: fields[7] as int,
      email: fields[3] as String,
      isLoggedin: fields[0] as bool,
      name: fields[2] as String,
      password: fields[5] as String,
      paymentMethod: fields[9] as int,
      phone: fields[4] as String,
      skip: fields[1] as bool,
      last_date: fields[6] as DateTime,
      uid: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.isLoggedin)
      ..writeByte(1)
      ..write(obj.skip)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.last_date)
      ..writeByte(7)
      ..write(obj.days)
      ..writeByte(8)
      ..write(obj.cycle)
      ..writeByte(9)
      ..write(obj.paymentMethod)
      ..writeByte(10)
      ..write(obj.uid);
  }
}
