import 'dart:ffi';
import 'package:ffi/ffi.dart';

// Structure zint_symbol
class ZintSymbol extends Struct {
  @Int32()
  external int symbology;

  @Float()
  external double height;

  @Float()
  external double scale;

  @Int32()
  external int whitespace_width;

  @Int32()
  external int whitespace_height;

  @Int32()
  external int border_width;

  @Int32()
  external int output_options;

  external Pointer<Utf8> fgcolour;

  external Pointer<Utf8> bgcolour;

  external Pointer<Utf8> outfile;

  external Pointer<Utf8> primary;

  @Int32()
  external int option_1;

  @Int32()
  external int option_2;

  @Int32()
  external int option_3;

  @Int32()
  external int show_hrt;

  @Int32()
  external int input_mode;

  @Int32()
  external int eci;
}

// Function definitions
typedef ZintCreate = Pointer<ZintSymbol> Function();
typedef ZintCreateDart = Pointer<ZintSymbol> Function();

typedef ZintDelete = Void Function(Pointer<ZintSymbol>);
typedef ZintDeleteDart = void Function(Pointer<ZintSymbol>);

typedef ZintEncode = Int32 Function(Pointer<ZintSymbol>, Pointer<Utf8>, Int32);
typedef ZintEncodeDart = int Function(Pointer<ZintSymbol>, Pointer<Utf8>, int);

typedef ZintPrint = Int32 Function(Pointer<ZintSymbol>, Int32);
typedef ZintPrintDart = int Function(Pointer<ZintSymbol>, int);

class ZintBindings {
  final DynamicLibrary _lib;

  late final ZintCreateDart create;
  late final ZintDeleteDart delete;
  late final ZintEncodeDart encode;
  late final ZintPrintDart print;

  ZintBindings(DynamicLibrary lib) : _lib = lib {
    create = _lib.lookupFunction<ZintCreate, ZintCreateDart>('ZBarcode_Create');
    delete = _lib.lookupFunction<ZintDelete, ZintDeleteDart>('ZBarcode_Delete');
    encode = _lib.lookupFunction<ZintEncode, ZintEncodeDart>('ZBarcode_Encode');
    print = _lib.lookupFunction<ZintPrint, ZintPrintDart>('ZBarcode_Print');
  }
}
