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

  // Ajouter d'autres méthodes pour configurer les options
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

// etc...
}
