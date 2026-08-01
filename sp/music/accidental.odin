package sp_music

Accidental :: i8

Accidental__TRIPLE_FLAT :: -3
Accidental__DOUBLE_FLAT :: -2
Accidental__FLAT :: -1
Accidental__NATURAL :: 0
Accidental__SHARP :: 1
Accidental__DOUBLE_SHARP :: 2
Accidental__TRIPLE_SHARP :: 3

Accidental__Err__sharpen :: enum {
    Ok,
    AlreadySharpestVariant,
}

Accidental__sharpen :: proc(accidental: Accidental) -> (sharpened: Accidental, err: Accidental__Err__sharpen) {
    if accidental == max(Accidental) {
        err = .AlreadySharpestVariant
    } else {
        sharpened = accidental + Accidental__SHARP
        err = .Ok
    }

    return
}

Accidental__Err__flatten :: enum {
    Ok,
    AlreadyFlattestVariant,
}

Accidental__flatten :: proc(accidental: Accidental) -> (flattened: Accidental, err: Accidental__Err__flatten) {
    if accidental == min(Accidental) {
        err = .AlreadyFlattestVariant
    } else {
        flattened = accidental + Accidental__FLAT
        err = .Ok
    }

    return
}
