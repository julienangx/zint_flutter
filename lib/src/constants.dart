/// Symbologies supportées
class BarcodeType {
  // Codes linéaires
  static const CODE11 = 1;
  static const C25STANDARD = 2;
  static const C25INTER = 3;
  static const C25IATA = 4;
  static const C25LOGIC = 6;
  static const C25IND = 7;
  static const CODE39 = 8;
  static const EXCODE39 = 9;
  static const EANX = 13;
  static const EANX_CHK = 14;
  static const GS1_128 = 16;
  static const CODABAR = 18;
  static const CODE128 = 20;
  static const DPLEIT = 21;
  static const DPIDENT = 22;
  static const CODE16K = 23;
  static const CODE49 = 24;
  static const CODE93 = 25;
  static const FLAT = 28;
  static const DBAR_OMN = 29;
  static const DBAR_LTD = 30;
  static const DBAR_EXP = 31;
  static const TELEPEN = 32;
  static const UPCA = 34;
  static const UPCA_CHK = 35;
  static const UPCE = 37;
  static const UPCE_CHK = 38;
  static const POSTNET = 40;
  static const MSI_PLESSEY = 47;
  static const FIM = 49;
  static const LOGMARS = 50;
  static const PHARMA = 51;
  static const PZN = 52;
  static const PHARMA_TWO = 53;
  static const PHARMA_MINI = 54;
  static const PDF417 = 55;
  static const PDF417COMP = 56;
  static const MAXICODE = 57;
  static const QRCODE = 58;
  static const CODE128B = 60;
  static const AUSPOST = 63;
  static const AUSREPLY = 66;
  static const AUSROUTE = 67;
  static const AUSREDIRECT = 68;
  static const ISBNX = 69;
  static const RM4SCC = 70;
  static const DATAMATRIX = 71;
  static const EAN14 = 72;
  static const VIN = 73;
  static const CODABLOCKF = 74;
  static const NVE18 = 75;
  static const JAPANPOST = 76;
  static const KOREAPOST = 77;
  static const DBAR_STK = 79;
  static const DBAR_OMNSTK = 80;
  static const DBAR_EXPSTK = 81;
  static const PLANET = 82;
  static const MICROPDF417 = 84;
  static const USPS_IMAIL = 85;
  static const PLESSEY = 86;
  static const TELEPEN_NUM = 87;
  static const ITF14 = 89;
  static const KIX = 90;
  static const AZTEC = 92;
  static const DAFT = 93;
  static const DPD = 96;
  static const MICROQR = 97;
  static const HIBC_128 = 98;
  static const HIBC_39 = 99;
  static const HIBC_DM = 102;
  static const HIBC_QR = 104;
  static const HIBC_PDF = 106;
  static const HIBC_MICPDF = 108;
  static const HIBC_BLOCKF = 110;
  static const HIBC_AZTEC = 112;
  static const DOTCODE = 115;
  static const HANXIN = 116;
  static const MAILMARK_2D = 119;
  static const UPU_S10 = 120;
  static const MAILMARK_4S = 121;
  static const CHANNEL = 140;
  static const CODEONE = 141;
  static const GRIDMATRIX = 142;
  static const UPNQR = 143;
  static const ULTRA = 144;
  static const RMQR = 145;
}

/// Options de sortie
class OutputOption {
  static const NONE = 0;
  static const BARCODE_BIND = 2;
  static const BARCODE_BOX = 4;
  static const BARCODE_STDOUT = 8;
  static const READER_INIT = 16;
  static const SMALL_TEXT = 32;
  static const BOLD_TEXT = 64;
  static const CMYK_COLOUR = 128;
  static const BARCODE_DOTTY_MODE = 256;
  static const GS1_GS_SEPARATOR = 512;
  static const OUT_BUFFER_INTERMEDIATE = 1024;
  static const BARCODE_QUIET_ZONES = 2048;
  static const BARCODE_NO_QUIET_ZONES = 4096;
  static const COMPLIANT_HEIGHT = 8192;
}

/// Modes d'entrée
class InputMode {
  static const DATA_MODE = 0;
  static const UNICODE_MODE = 1;
  static const GS1_MODE = 2;
  static const ESCAPE_MODE = 8;
  static const GS1PARENS_MODE = 16;
  static const GS1NOCHECK_MODE = 32;
  static const HEIGHTPERROW_MODE = 64;
  static const FAST_MODE = 128;
}

/// Niveaux d'avertissement
class WarnLevel {
  static const WARN_DEFAULT = 0;
  static const WARN_FAIL_ALL = 2;
}

/// Codes de retour d'erreur
class ErrorCode {
  static const ZINT_WARN_INVALID_OPTION = 2;
  static const ZINT_WARN_USES_ECI = 3;
  static const ZINT_WARN_NONCOMPLIANT = 4;
  static const ZINT_ERROR = 5;
  static const ZINT_ERROR_TOO_LONG = 5;
  static const ZINT_ERROR_INVALID_DATA = 6;
  static const ZINT_ERROR_INVALID_CHECK = 7;
  static const ZINT_ERROR_INVALID_OPTION = 8;
  static const ZINT_ERROR_ENCODING_PROBLEM = 9;
  static const ZINT_ERROR_FILE_ACCESS = 10;
  static const ZINT_ERROR_MEMORY = 11;
  static const ZINT_ERROR_FILE_WRITE = 12;
  static const ZINT_ERROR_USES_ECI = 13;
  static const ZINT_ERROR_NONCOMPLIANT = 14;
}

/// Capacités des symbologies
class SymbolCapability {
  static const ZINT_CAP_HRT = 0x0001;
  static const ZINT_CAP_STACKABLE = 0x0002;
  static const ZINT_CAP_EXTENDABLE = 0x0004;
  static const ZINT_CAP_COMPOSITE = 0x0008;
  static const ZINT_CAP_ECI = 0x0010;
  static const ZINT_CAP_GS1 = 0x0020;
  static const ZINT_CAP_DOTTY = 0x0040;
  static const ZINT_CAP_QUIET_ZONES = 0x0080;
  static const ZINT_CAP_FIXED_RATIO = 0x0100;
  static const ZINT_CAP_READER_INIT = 0x0200;
  static const ZINT_CAP_FULL_MULTIBYTE = 0x0400;
  static const ZINT_CAP_MASK = 0x0800;
  static const ZINT_CAP_STRUCTAPP = 0x1000;
  static const ZINT_CAP_COMPLIANT_HEIGHT = 0x2000;
}

/// Valeurs par défaut
class Defaults {
  static const DEFAULT_SCALE = 1.0;
  static const DEFAULT_DOT_SIZE = 4.0 / 5.0;
  static const DEFAULT_GUARD_DESCENT = 5.0;
  static const DEFAULT_TEXT_GAP = 1.0;
  static const DEFAULT_BORDER_WIDTH = 0;
  static const DEFAULT_WHITESPACE_WIDTH = 0;
  static const DEFAULT_WHITESPACE_HEIGHT = 0;
  static const DEFAULT_SHOW_HRT = 1;
  static const DEFAULT_FOREGROUND = "000000";
  static const DEFAULT_BACKGROUND = "ffffff";
}

/// Extensions de fichiers supportées
class FileExtension {
  static const PNG = ".png";
  static const SVG = ".svg";
  static const EPS = ".eps";
  static const BMP = ".bmp";
  static const PCX = ".pcx";
  static const GIF = ".gif";
  static const EMF = ".emf";
  static const TIF = ".tif";
  static const TXT = ".txt";
}

