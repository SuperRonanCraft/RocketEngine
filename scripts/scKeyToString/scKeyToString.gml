/// @desc get a keys text id
/// @arg key-id

if(argument0 > 48 && argument0 < 91)
	return chr(argument0);
switch (argument0) {
    case -1: return "N/A";
    case 8: return "BACK";
    case 9: return "TAB";
    case 13: return "ENTER";
    case 16: return "SHIFT";
    case 17: return "CTRL";
    case 18: return "ALT";
    case 19: return "BREAK";
    case 20: return "CAPS";
    case 27: return "ESC";
	case 32: return "SPACE";
    case 33: return "PG-UP";
    case 34: return "PG-DOWN";
    case 35: return "END";
    case 36: return "HOME";
    case 37: return "LEFT";
    case 38: return "UP";
    case 39: return "RIGHT";
    case 40: return "DOWN";
    case 45: return "INS";
    case 46: return "DLT";
//	case 91: return "Windows";
    case 96: return "N 0";
    case 97: return "N 1";
    case 98: return "N 2";
    case 99: return "N 3";
    case 100: return "N 4";
    case 101: return "N 5";
    case 102: return "N 6";
    case 103: return "N 7";
    case 104: return "N 8";
    case 105: return "N 9";
    case 106: return "N *";
    case 107: return "N +";
    case 109: return "N -";
    case 110: return "N .";
    case 111: return "N /";
    case 112: return "F1";
    case 113: return "F2";
    case 114: return "F3";
    case 115: return "F4";
    case 116: return "F5";
    case 117: return "F6";
    case 118: return "F7";
    case 119: return "F8";
    case 120: return "F9";
    case 121: return "F10";
    case 122: return "F11";
    case 123: return "F12";
    case 144: return "N-LOCK";
    case 145: return "S-LOCK";
	case 162: return "L-CTRL";
	case 163: return "R-CTRL";
	case 164: return "L-ALT";
	case 165: return "R-ALT";
    case 186: return ";";
    case 187: return "=";
    case 188: return ",";
    case 189: return "-";
    case 190: return ".";
    case 191: return "\\";
    case 192: return "`";
    case 219: return "/";
    case 220: return "[";
    case 221: return "]";
    case 222: return "'";
}
//show_debug_message(argument0);
//Return -1 if key not found
return -1;