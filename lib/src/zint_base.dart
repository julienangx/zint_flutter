import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;
import 'generated_bindings.dart';

class ZintBarcode {
  static ZintBindings? _bindings;
  late Pointer<ZintSymbol> _handle;

  static ZintBindings get bindings {
    if (_bindings == null) {
      final libraryPath = _getLibraryPath();
      final dylib = DynamicLibrary.open(libraryPath);
      _bindings = ZintBindings(dylib);
    }
    return _bindings!;
  }

  static String _getLibraryPath() {
    if (Platform.isMacOS) {
      return path.join(
        Directory.current.path,
        'assets',
        'macos',
        'libzint.dylib',
      );
    } else if (Platform.isWindows) {
      return path.join(
        Directory.current.path,
        'assets',
        'windows',
        'zint.dll',
      );
    }
    throw UnsupportedError('Unsupported platform');
  }

  ZintBarcode() {
    _handle = bindings.create();
  }

  void dispose() {
    bindings.delete(_handle);
  }

  int encode(String data, {int symbology = 20}) { // 20 = CODE128 par défaut
    _handle.ref.symbology = symbology;

    final dataPtr = data.toNativeUtf8();
    final result = bindings.encode(_handle, dataPtr, data.length);
    calloc.free(dataPtr);

    return result;
  }

  int print({int rotation = 0}) {
    return bindings.print(_handle, rotation);
  }

  void setHeight(double height) {
    _handle.ref.height = height;
  }

  void setScale(double scale) {
    _handle.ref.scale = scale;
  }

  void setForegroundColor(String color) {
    final colorPtr = color.toNativeUtf8();
    _handle.ref.fgcolour = colorPtr;
  }

  void setSymbology(int symbology) {
    _handle.ref.symbology = symbology;
  }

  void setWhitespaceWidth(int width) {
    _handle.ref.whitespace_width = width;
  }

  void setWhitespaceHeight(int height) {
    _handle.ref.whitespace_height = height;
  }

  void setBorderWidth(int width) {
    _handle.ref.border_width = width;
  }

  void setOutputOptions(int options) {
    _handle.ref.output_options = options;
  }

  void setBackgroundColor(String color) {
    final colorPtr = color.toNativeUtf8();
    _handle.ref.bgcolour = colorPtr;
  }

  void setOutputFile(String filename) {
    final filenamePtr = filename.toNativeUtf8();
    _handle.ref.outfile = filenamePtr;
  }

  void setPrimary(String message) {
    final messagePtr = message.toNativeUtf8();
    _handle.ref.primary = messagePtr;
  }

  void setOption1(int option) {
    _handle.ref.option_1 = option;
  }

  void setOption2(int option) {
    _handle.ref.option_2 = option;
  }

  void setOption3(int option) {
    _handle.ref.option_3 = option;
  }

  void setShowHRT(bool show) {
    _handle.ref.show_hrt = show ? 1 : 0;
  }

  void setInputMode(int mode) {
    _handle.ref.input_mode = mode;
  }

  void setECI(int eci) {
    _handle.ref.eci = eci;
  }

}
