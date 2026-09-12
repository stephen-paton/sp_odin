package sp_music

import "core:math/rand"

Note :: struct {
    letter: NoteLetter,
    accidental: Accidental
}

Note__try_get__relative__Err :: enum {
    Ok,
    ScaleDegreeTooLow,
    AccidentalCannotBeSharpened,
    AccidentalCannotBeFlattened,
}

Note__try_get__relative :: proc(note: Note, scale_degree: ScaleDegree) -> (relative: Note, err: Note__try_get__relative__Err) {
    relative = note
    scale_degree := scale_degree

    if scale_degree.number < ScaleDegreeNumber__MIN {
        err = .ScaleDegreeTooLow
        return
    }

    if scale_degree.number > ScaleDegreeNumber__MAX do scale_degree.number %= ScaleDegreeNumber__MAX

    resultant_action: NoteLetter__get__adjacent__ResultantAction

    switch scale_degree.number {
        case 2:
            relative.letter, resultant_action = NoteLetter__get__next(relative.letter, 2)
        case 3:
            relative.letter, resultant_action = NoteLetter__get__next(relative.letter, 4)
        case 4:
            relative.letter, resultant_action = NoteLetter__get__prev(relative.letter)
        case 5:
            relative.letter, resultant_action = NoteLetter__get__next(relative.letter)
        case 6:
            relative.letter, resultant_action = NoteLetter__get__next(relative.letter, 3)
        case 7:
            relative.letter, resultant_action = NoteLetter__get__next(relative.letter, 5)
    }

    #partial switch resultant_action {
        case .Sharpen:
            err__try_get__sharpened: Accidental__try_get__sharpened__Err
            relative.accidental, err__try_get__sharpened = Accidental__try_get__sharpened(relative.accidental)

            if err__try_get__sharpened == .AlreadySharpestVariant {
                err = .AccidentalCannotBeSharpened
                return
            }
        case .Flatten:
            err__try_get__flattened: Accidental__try_get__flattened__Err
            relative.accidental, err__try_get__flattened = Accidental__try_get__flattened(relative.accidental)

            if err__try_get__flattened == .AlreadyFlattestVariant {
                err = .AccidentalCannotBeFlattened
                return
            }
    }

    if scale_degree.accidental > 0 {
        for i in 1..=scale_degree.accidental {
            err__try_get__sharpened: Accidental__try_get__sharpened__Err
            relative.accidental, err__try_get__sharpened = Accidental__try_get__sharpened(relative.accidental)

            if err__try_get__sharpened == .AlreadySharpestVariant {
                err = .AccidentalCannotBeSharpened
                return
            }
        }
    } else if scale_degree.accidental < 0 {
        for i in scale_degree.accidental..<0 {
            err__try_get__flattened: Accidental__try_get__flattened__Err
            relative.accidental, err__try_get__flattened = Accidental__try_get__flattened(relative.accidental)

            if err__try_get__flattened == .AlreadyFlattestVariant {
                err = .AccidentalCannotBeFlattened
                return
            }
        }
    } 

    return
}

Note__new__flat :: proc(letter: NoteLetter) -> (note: Note) {
    note = { letter = letter, accidental = Accidental__FLAT }
    
    return
}

Note__new__natural :: proc(letter: NoteLetter) -> (note: Note) {
    note = { letter = letter, accidental = Accidental__NATURAL }
    
    return
}

Note__new__sharp :: proc(letter: NoteLetter) -> (note: Note) {
    note = { letter = letter, accidental = Accidental__SHARP }
    
    return
}

Note__major_roots := [MajorKey]Note {
    .C = { letter = .C, accidental = Accidental__NATURAL },
    .G = { letter = .G, accidental = Accidental__NATURAL },
    .D = { letter = .D, accidental = Accidental__NATURAL },
    .A = { letter = .A, accidental = Accidental__NATURAL },
    .E = { letter = .E, accidental = Accidental__NATURAL },
    .B = { letter = .B, accidental = Accidental__NATURAL },
    .FSharp = { letter = .F, accidental = Accidental__SHARP },
    .CSharp = { letter = .C, accidental = Accidental__SHARP },
    .CFlat = { letter = .C, accidental = Accidental__FLAT },
    .GFlat = { letter = .G, accidental = Accidental__FLAT },
    .DFlat = { letter = .D, accidental = Accidental__FLAT },
    .AFlat = { letter = .A, accidental = Accidental__FLAT },
    .EFlat = { letter = .E, accidental = Accidental__FLAT },
    .BFlat = { letter = .B, accidental = Accidental__FLAT },
    .F = { letter = .F, accidental = Accidental__NATURAL },
}

Note__new__major_root :: proc(major: MajorKey) -> (note: Note) {
    note = Note__major_roots[major]

    return
}

Note__minor_roots := [MinorKey]Note {
    .A = { letter = .A, accidental = Accidental__NATURAL },
    .E = { letter = .E, accidental = Accidental__NATURAL },
    .B = { letter = .B, accidental = Accidental__NATURAL },
    .FSharp = { letter = .F, accidental = Accidental__SHARP },
    .CSharp = { letter = .C, accidental = Accidental__SHARP },
    .GSharp = { letter = .G, accidental = Accidental__SHARP },
    .DSharp = { letter = .D, accidental = Accidental__SHARP },
    .ASharp = { letter = .A, accidental = Accidental__SHARP },
    .AFlat = { letter = .A, accidental = Accidental__FLAT },
    .EFlat = { letter = .E, accidental = Accidental__FLAT },
    .BFlat = { letter = .B, accidental = Accidental__FLAT },
    .F = { letter = .F, accidental = Accidental__NATURAL },
    .C = { letter = .C, accidental = Accidental__NATURAL },
    .G = { letter = .G, accidental = Accidental__NATURAL },
    .D = { letter = .D, accidental = Accidental__NATURAL },
}

Note__new__minor_root :: proc(minor: MinorKey) -> (note: Note) {
    note = Note__minor_roots[minor]
    
    return
}

Note__new__random_major_root :: proc() -> (note: Note) {
    note = Note__new__major_root(rand.choice_enum(MajorKey))

    return
}

Note__new__random_minor_root :: proc() -> (note: Note) {
    note = Note__new__minor_root(rand.choice_enum(MinorKey))

    return
}

Note__new__random_root :: proc() -> (note: Note) {
    switch rand.choice_enum(KeyType) {
        case .Major: note = Note__new__random_major_root()
        case .Minor: note = Note__new__random_minor_root()
    }

    return
}
