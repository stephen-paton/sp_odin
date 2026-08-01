package sp_music

ScaleDegree :: struct {
    number: ScaleDegreeNumber,
    accidental: Accidental,
}

ScaleDegree__1 :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 1, accidental = Accidental__NATURAL }
    return
}

ScaleDegree__2b :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 2, accidental = Accidental__FLAT }
    return
}

ScaleDegree__2 :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 2, accidental = Accidental__NATURAL }
    return
}

ScaleDegree__3b :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 3, accidental = Accidental__FLAT }
    return
}

ScaleDegree__3 :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 3, accidental = Accidental__NATURAL }
    return
}

ScaleDegree__4 :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 4, accidental = Accidental__NATURAL }
    return
}

ScaleDegree__4s :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 4, accidental = Accidental__SHARP }
    return
}

ScaleDegree__5b :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 5, accidental = Accidental__FLAT }
    return
}

ScaleDegree__5 :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 5, accidental = Accidental__NATURAL }
    return
}

ScaleDegree__5s :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 5, accidental = Accidental__SHARP }
    return
}

ScaleDegree__6b :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 6, accidental = Accidental__FLAT }
    return
}

ScaleDegree__6 :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 6, accidental = Accidental__NATURAL }
    return
}

ScaleDegree__7b :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 7, accidental = Accidental__FLAT }
    return
}

ScaleDegree__7 :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 7, accidental = Accidental__NATURAL }
    return
}

ScaleDegree__8 :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 8, accidental = Accidental__NATURAL }
    return
}

ScaleDegree__9b :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 9, accidental = Accidental__FLAT }
    return
}

ScaleDegree__9 :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 9, accidental = Accidental__NATURAL }
    return
}

ScaleDegree__9s :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 9, accidental = Accidental__SHARP }
    return
}

ScaleDegree__11 :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 11, accidental = Accidental__NATURAL }
    return
}

ScaleDegree__11s :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 11, accidental = Accidental__SHARP }
    return
}

ScaleDegree__13b :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 13, accidental = Accidental__FLAT }
    return
}

ScaleDegree__13 :: proc() -> (scale_degree: ScaleDegree) {
    scale_degree = { number = 13, accidental = Accidental__NATURAL }
    return
}
