package sp_music

NoteLetter :: enum {
    F,
    C,
    G,
    D,
    A,
    E,
    B,
}

NoteLetter__ResultantAction :: enum {
    None,
    Sharpen,
    Flatten,
}

NoteLetter__next :: proc(letter: NoteLetter, iterations: u8 = 1) -> (next: NoteLetter, resultant_action: NoteLetter__ResultantAction) {
    capped_iterations := int(iterations)
    capped_iterations %= int(NoteLetter.B) + 1

    if capped_iterations == 0 {
        next = letter
        resultant_action = .None if iterations == 0 else .Sharpen
    } else if capped_iterations == 1 {
        int_next := int(letter) + 1

        if int_next > int(NoteLetter.B) {
            int_next = int(NoteLetter.F)
            resultant_action = .Sharpen
        } else {
            resultant_action = .None
        }
        
        next = NoteLetter(int_next)
    } else {
        next = letter
        temp_resultant_action: NoteLetter__ResultantAction = .None

        for i in 1..=capped_iterations {
            next, temp_resultant_action = NoteLetter__next(next)
            if temp_resultant_action == .Sharpen do resultant_action = .Sharpen
        }
    }
    
    return
}

NoteLetter__prev :: proc(letter: NoteLetter, iterations: u8 = 1) -> (prev: NoteLetter, resultant_action: NoteLetter__ResultantAction) {
    capped_iterations := int(iterations)
    capped_iterations %= int(NoteLetter.B) + 1

    if capped_iterations == 0 {
        prev = letter
        resultant_action = .None if iterations == 0 else .Flatten
    } else if capped_iterations == 1 {
        int_prev := int(letter) - 1

        if int_prev < int(NoteLetter.F) {
            int_prev = int(NoteLetter.B)
            resultant_action = .Flatten
        } else {
            resultant_action = .None
        }

        prev = NoteLetter(int_prev)
    } else {
        prev = letter

        temp_resultant_action: NoteLetter__ResultantAction = .None

        for i in 1..=capped_iterations {
            prev, temp_resultant_action = NoteLetter__prev(prev)
            if temp_resultant_action == .Flatten do resultant_action = .Flatten
        }
    }
    
    return
}
