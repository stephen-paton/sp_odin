package sp_music

Accidental :: i8

Accidental__Err__sharpen :: enum {
    Ok,
    AlreadySharpestVariant,
}

Accidental__sharpen :: proc(accidental: Accidental) -> (sharpened: Accidental, err: Accidental__Err__sharpen) {
    if accidental == max(Accidental) {
        err = .AlreadySharpestVariant
    } else {
        sharpened = accidental + 1
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
        flattened = accidental - 1
        err = .Ok
    }

    return
}
