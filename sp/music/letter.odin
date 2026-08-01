package sp_music

Letter :: enum {
    F,
    C,
    G,
    D,
    A,
    E,
    B,
}

Letter__next :: proc(letter: Letter, iterations: u8 = 1) -> (next: Letter) {
    iterations := int(iterations)
    iterations %= int(Letter.B) + 1

    if iterations == 0 {
        next = letter
    } else if iterations == 1 {
        int_next := int(letter) + 1
        if int_next > int(Letter.B) do int_next = int(Letter.F)
        next = Letter(int_next)
    } else {
        next = letter
        for i in 1..=iterations do next = Letter__next(next)
    }
    
    return
}

Letter__prev :: proc(letter: Letter, iterations: u8 = 1) -> (prev: Letter) {
    iterations := int(iterations)
    iterations %= int(Letter.B) + 1

    if iterations == 0 {
        prev = letter
    } else if iterations == 1 {
        int_prev := int(letter) - 1
        if int_prev < int(Letter.F) do int_prev = int(Letter.B)
        prev = Letter(int_prev)
    } else {
        prev = letter
        for i in 1..=iterations do prev = Letter__prev(prev)
    }
    
    return
}
