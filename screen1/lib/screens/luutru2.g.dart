part of 'luutru2.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaminAdapter extends TypeAdapter<Pamin> {
  @override
  final int typeId = 1;

  @override
  Pamin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pamin(1, '', '', true);
  }

  @override
  void write(BinaryWriter writer, Pamin obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaminAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
