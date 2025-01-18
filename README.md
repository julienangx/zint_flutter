# Zint Flutter

[![pub package](https://img.shields.io/pub/v/zint_flutter.svg)](https://pub.dev/packages/zint_flutter)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Un wrapper Flutter pour la bibliothèque Zint, permettant la génération de plus de 50 types de codes-barres différents.

## Caractéristiques

- Support de plus de 50 symbologies de codes-barres
- Génération haute performance avec code natif
- Multiples formats de sortie (PNG, SVG, EPS, etc.)
- Personnalisation complète (couleurs, taille, options)
- Support des plateformes Windows et macOS

## Installation

### 1. Dépendance
Ajoutez ceci à votre fichier `pubspec.yaml` :

```yaml
dependencies:
  zint_flutter: ^1.0.0
```

### 2. Configuration plateforme

#### macOS
1. Ajoutez `libzint.dylib` dans le dossier `macos/Frameworks`
2. Intégrez la bibliothèque dans Xcode :
   - Ouvrez `macos/Runner.xcworkspace`
   - Glissez `libzint.dylib` dans le projet
   - Vérifiez qu'il est listé dans "Frameworks"

#### Windows
1. Placez `zint.dll` dans le dossier de votre application
2. Assurez-vous qu'il est accessible lors de l'exécution

## Utilisation

### Code de base

```dart
import 'package:zint_flutter/zint_flutter.dart';

final barcode = ZintBarcode();
try {
  // Configuration du code-barres
  barcode.setSymbology(BarcodeType.QRCODE);
  barcode.setScale(2.0);
  barcode.setForegroundColor("000000");
  barcode.setOutputFile("output.png");

  // Encodage des données
  final result = barcode.encode("Hello World");
  
  // Génération de l'image
  if (result == 0) {
    barcode.print();
  }
} finally {
  barcode.dispose();
}
```

### Configuration avancée

```dart
final barcode = ZintBarcode();
try {
  // Type de code-barres
  barcode.setSymbology(BarcodeType.CODE128);
  
  // Apparence
  barcode.setScale(3.0);
  barcode.setForegroundColor("FF0000"); // Rouge
  barcode.setBackgroundColor("FFFFFF"); // Blanc
  
  // Options
  barcode.setOutputOptions(
    OutputOption.BARCODE_BIND | 
    OutputOption.BARCODE_BOX |
    OutputOption.BOLD_TEXT
  );
  
  // Mode d'entrée
  final result = barcode.encode(
    "12345", 
    inputMode: InputMode.UNICODE_MODE
  );
  
  if (result >= ErrorCode.ZINT_ERROR) {
    print("Erreur: ${barcode.getError()}");
  }
} finally {
  barcode.dispose();
}
```

### Types de codes-barres supportés

```dart
// Quelques exemples de symbologies disponibles
BarcodeType.QRCODE        // QR Code
BarcodeType.CODE128       // Code 128
BarcodeType.DATAMATRIX   // Data Matrix
BarcodeType.PDF417       // PDF417
BarcodeType.AZTEC        // Aztec Code
BarcodeType.CODE39       // Code 39
BarcodeType.EAN13        // EAN-13
BarcodeType.UPCA         // UPC-A
// Et bien plus...
```

### Options de sortie

```dart
OutputOption.BARCODE_BIND         // Ajoute des barres de liaison
OutputOption.BARCODE_BOX         // Ajoute un cadre
OutputOption.SMALL_TEXT         // Texte en petit
OutputOption.BOLD_TEXT         // Texte en gras
OutputOption.BARCODE_DOTTY_MODE // Mode pointillé
OutputOption.QUIET_ZONES      // Zones calmes
```

### Modes d'entrée

```dart
InputMode.DATA_MODE      // Mode données standard
InputMode.UNICODE_MODE   // Support Unicode
InputMode.GS1_MODE      // Format GS1
InputMode.ESCAPE_MODE   // Séquences d'échappement
```

## Formats de sortie supportés

- PNG (par défaut)
- SVG
- EPS
- BMP
- PCX
- GIF
- EMF
- TIF
- TXT

## Gestion des erreurs

```dart
final barcode = ZintBarcode();
try {
  final result = barcode.encode("données");
  
  switch (result) {
    case ErrorCode.ZINT_ERROR:
      print("Erreur générale");
      break;
    case ErrorCode.ZINT_ERROR_TOO_LONG:
      print("Données trop longues");
      break;
    case ErrorCode.ZINT_ERROR_INVALID_DATA:
      print("Données invalides");
      break;
    // etc.
  }
  
  if (result >= ErrorCode.ZINT_ERROR) {
    print("Message d'erreur: ${barcode.getError()}");
  }
} finally {
  barcode.dispose();
}
```

## Résolution des problèmes

### La bibliothèque native n'est pas trouvée

1. Vérifiez que la bibliothèque native est présente
2. Sur macOS : `libzint.dylib` doit être dans `macos/Frameworks`
3. Sur Windows : `zint.dll` doit être accessible

### Erreurs d'encodage

1. Vérifiez le format des données d'entrée
2. Utilisez le bon mode d'entrée (DATA_MODE, UNICODE_MODE, etc.)
3. Respectez les limitations de la symbologie choisie

## Contribuer

Les contributions sont bienvenues ! 

1. Fork le projet
2. Créez votre branche (`git checkout -b feature/NouvelleFonctionnalite`)
3. Commitez vos changements (`git commit -m 'Ajout nouvelle fonctionnalité'`)
4. Push vers la branche (`git push origin feature/NouvelleFonctionnalite`)
5. Ouvrez une Pull Request

## Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

## Crédits

- Basé sur la bibliothèque [Zint](https://www.zint.org.uk/)
- Développé avec [Flutter](https://flutter.dev)

