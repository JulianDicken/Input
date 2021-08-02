/// @param keycode

function __input_key_get_name(_key)
{
    if ((_key >= ord("A")) && (_key <= ord("Z")))
    {
        //Latin letters
        return chr(_key);
    }
    else if (_key >= ord("0")) && (_key <= ord("9"))
    {
        //Top row numbers
        return chr(_key);
    }
    else 
    {
        //Universal non-UTF8 keycodes
        switch(_key)
        {             
            case vk_up:    return "arrow up";    break;
            case vk_down:  return "arrow down";  break;
            case vk_left:  return "arrow left";  break;
            case vk_right: return "arrow right"; break;
            
            case vk_escape:    return "escape";    break;
            case vk_backspace: return "backspace"; break;
            case vk_space:     return "space";     break;
            case vk_tab:       return "tab";       break;
            case vk_enter:     return "enter";     break;      
        }
        
        // Desktop platform non-UTF8 keycodes
        if (__INPUT_ON_DESKTOP) 
        {
            //Common function row (F1 - F10)
            if ((_key >= vk_f1) && (_key <= vk_f10))
            {
                return ("F" + string(1 + _key - vk_f1));
            }
            
            switch(_key)
            {                 
                //Symbols
                case 186: return ";";  break;
                case 188: return ",";  break;
                case 190: return ".";  break;
                case 191: return "/";  break;
                case 219: return "[";  break;
                case 220: return "\\"; break;
                case 221: return "]";  break;
            
                //Control
                case  20: return "caps lock";   break;
                case  93: return "menu";        break;
                case 144: return "num lock";    break;
                case 145: return "scroll lock"; break;
                        
                //Numpad
                case vk_numpad0:  return "numpad 0"; break;
                case vk_numpad1:  return "numpad 1"; break;
                case vk_numpad2:  return "numpad 2"; break;
                case vk_numpad3:  return "numpad 3"; break;
                case vk_numpad4:  return "numpad 4"; break;
                case vk_numpad5:  return "numpad 5"; break;
                case vk_numpad6:  return "numpad 6"; break;
                case vk_numpad7:  return "numpad 7"; break;
                case vk_numpad8:  return "numpad 8"; break;
                case vk_numpad9:  return "numpad 9"; break;
                case vk_divide:   return "numpad /"; break;
                case vk_decimal:  return "numpad ."; break;
                case vk_multiply: return "numpad *"; break;
                case vk_add:      return "numpad +"; break;
                case vk_subtract: return "numpad -"; break;
            
                //Command keys
                case vk_rshift: return "right shift"; break;
                case vk_lshift: return "left shift";  break;
                case vk_shift:  return "shift";       break;
            
                case vk_rcontrol: return "right ctrl"; break;
                case vk_lcontrol: return "left ctrl";  break;
                case vk_control:  return "ctrl";       break;
            
                case vk_ralt: return "right alt"; break;
                case vk_lalt: return "left alt";  break;
                case vk_alt:  return "alt";       break;
            
                case vk_home:        return "home";         break;
                case vk_end:         return "end";          break;
                case vk_insert:      return "insert";       break;
                case vk_delete:      return "delete";       break;
                case vk_pagedown:    return "page down";    break;
                case vk_pageup:      return "page up";      break;
                case vk_printscreen: return "print screen"; break;
                case vk_pause:       return "pause break";  break;
            }
        }
        
        //Per platform non-UTF8 keycodes
        switch(os_type)
        {
            case os_windows:
                switch(_key)      
                {
                    case 122: return "F11"; break;
                    case 123: return "F12"; break;
                    case 124: return "F13"; break;
                    case 125: return "F14"; break;
                    case 126: return "F15"; break;
                    case 127: return "F16"; break;
                    case 128: return "F17"; break;
                    case 129: return "F18"; break;
                    case 130: return "F19"; break;
                    case 131: return "F20"; break;
                    case 132: return "F21"; break;
                    case 133: return "F22"; break;
                    case 134: return "F23"; break;

                    case 187: return "="; break;
                    case 189: return "-"; break;
                    case 192: return "`"; break;
                    case 222: return "'"; break;
            
                    case 12:  return "clear"; break;
                    
                    case vk_meta1:  return "left meta";  break;
                    case vk_meta2:  return "right meta"; break;
                }
            break;
            
            case os_macosx:
                switch(_key)      
                {
                    case 128: return "F11"; break;
                    case 129: return "F12"; break;
                    
                    case 24:  return "="; break;
                    case 109: return "-"; break;
                    case 222: return "'"; break;
                    
                    //Swapped on Mac
                    case vk_meta1:  return "right meta"; break;
                    case vk_meta2:  return "left meta";  break;
                }
            break;
            
            case os_linux:
                switch(_key)      
                {
                    case 128: return "F11"; break;
                    case 129: return "F12"; break;
                    
                    case 187: return "="; break;
                    case 189: return "-"; break;
                    case 192: return "'"; break;
                    case 223: return "`"; break;
                    
                    case vk_meta1:  return "left meta";  break;
                    case vk_meta2:  return "right meta"; break;
                }
            break;
            
            case os_android:
                switch(_key)      
                {
                    case 10: return "enter";
                }
            break;
        }
        
        return chr(_key); //Default to UTF8 character
    }
}
