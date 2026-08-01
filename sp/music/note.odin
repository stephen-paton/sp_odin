package sp_music

Note :: struct {
    letter: NoteLetter,
    accidental: Accidental
}

Note__Err__relative :: enum {
    Ok,
    ScaleDegreeTooLow,
    AccidentalCannotBeSharpened,
    AccidentalCannotBeFlattened,
}

Note__relative :: proc(note: Note, scale_degree: ScaleDegree) -> (relative: Note, err: Note__Err__relative) {
    relative = note
    scale_degree := scale_degree

    if scale_degree.number < ScaleDegreeNumber__MIN {
        err = .ScaleDegreeTooLow
        return
    }

    if scale_degree.number > ScaleDegreeNumber__MAX do scale_degree.number %= ScaleDegreeNumber__MAX

    resultant_action: NoteLetter__ResultantAction

    switch scale_degree.number {
        case 2:
            relative.letter, resultant_action = NoteLetter__next(relative.letter, 2)
        case 3:
            relative.letter, resultant_action = NoteLetter__next(relative.letter, 4)
        case 4:
            relative.letter, resultant_action = NoteLetter__prev(relative.letter)
        case 5:
            relative.letter, resultant_action = NoteLetter__next(relative.letter)
        case 6:
            relative.letter, resultant_action = NoteLetter__next(relative.letter, 3)
        case 7:
            relative.letter, resultant_action = NoteLetter__next(relative.letter, 5)
    }

    #partial switch resultant_action {
        case .Sharpen:
            sharpen_err: Accidental__Err__sharpen
            relative.accidental, sharpen_err = Accidental__sharpen(relative.accidental)

            if sharpen_err == .AlreadySharpestVariant {
                err = .AccidentalCannotBeSharpened
                return
            }
        case .Flatten:
            flatten_err: Accidental__Err__flatten
            relative.accidental, flatten_err = Accidental__flatten(relative.accidental)

            if flatten_err == .AlreadyFlattestVariant {
                err = .AccidentalCannotBeFlattened
                return
            }
    }

    if scale_degree.accidental > 0 {
        for i in 1..=scale_degree.accidental {
            sharpen_err: Accidental__Err__sharpen
            relative.accidental, sharpen_err = Accidental__sharpen(relative.accidental)

            if sharpen_err == .AlreadySharpestVariant {
                err = .AccidentalCannotBeSharpened
                return
            }
        }
    } else if scale_degree.accidental < 0 {
        for i in scale_degree.accidental..<0 {
            flatten_err: Accidental__Err__flatten
            relative.accidental, flatten_err = Accidental__flatten(relative.accidental)

            if flatten_err == .AlreadyFlattestVariant {
                err = .AccidentalCannotBeFlattened
                return
            }
        }
    } 

    return
}

// F
Note__Fb :: proc() -> (note: Note) {
    note = { letter = .F, accidental = Accidental__FLAT}
    return
}

Note__F :: proc() -> (note: Note) {
    note = { letter = .F, accidental = Accidental__NATURAL}
    return
}

Note__Fs :: proc() -> (note: Note) {
    note = { letter = .F, accidental = Accidental__SHARP}
    return
}

// C
Note__Cb :: proc() -> (note: Note) {
    note = { letter = .C, accidental = Accidental__FLAT}
    return
}

Note__C :: proc() -> (note: Note) {
    note = { letter = .C, accidental = Accidental__NATURAL}
    return
}

Note__Cs :: proc() -> (note: Note) {
    note = { letter = .C, accidental = Accidental__SHARP}
    return
}

// G
Note__Gb :: proc() -> (note: Note) {
    note = { letter = .G, accidental = Accidental__FLAT}
    return
}

Note__G :: proc() -> (note: Note) {
    note = { letter = .G, accidental = Accidental__NATURAL}
    return
}

Note__Gs :: proc() -> (note: Note) {
    note = { letter = .G, accidental = Accidental__SHARP}
    return
}

// D
Note__Db :: proc() -> (note: Note) {
    note = { letter = .D, accidental = Accidental__FLAT}
    return
}

Note__D :: proc() -> (note: Note) {
    note = { letter = .D, accidental = Accidental__NATURAL}
    return
}

Note__Ds :: proc() -> (note: Note) {
    note = { letter = .D, accidental = Accidental__SHARP}
    return
}

// A
Note__Ab :: proc() -> (note: Note) {
    note = { letter = .A, accidental = Accidental__FLAT}
    return
}

Note__A :: proc() -> (note: Note) {
    note = { letter = .A, accidental = Accidental__NATURAL}
    return
}

Note__As :: proc() -> (note: Note) {
    note = { letter = .A, accidental = Accidental__SHARP}
    return
}

// E
Note__Eb :: proc() -> (note: Note) {
    note = { letter = .E, accidental = Accidental__FLAT}
    return
}

Note__E :: proc() -> (note: Note) {
    note = { letter = .E, accidental = Accidental__NATURAL}
    return
}

Note__Es :: proc() -> (note: Note) {
    note = { letter = .E, accidental = Accidental__SHARP}
    return
}

// B
Note__Bb :: proc() -> (note: Note) {
    note = { letter = .B, accidental = Accidental__FLAT}
    return
}

Note__B :: proc() -> (note: Note) {
    note = { letter = .B, accidental = Accidental__NATURAL}
    return
}

Note__Bs :: proc() -> (note: Note) {
    note = { letter = .B, accidental = Accidental__SHARP}
    return
}
