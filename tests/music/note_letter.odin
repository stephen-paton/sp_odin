package sp_music_tests

import "core:testing"

import "sp:music"

@(test)
test__Letter__next :: proc(t: ^testing.T) {
    initial_letter: music.NoteLetter = .F
    letter := initial_letter
    resultant_action: music.NoteLetter__ResultantAction

    // automatic iterations
    letter, resultant_action = music.NoteLetter__next(initial_letter)
    testing.expect(t, letter == .C)
    testing.expect(t, resultant_action == .None)

    // explicit iterations
    letter, resultant_action = music.NoteLetter__next(initial_letter, 0)
    testing.expect(t, letter == .F)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__next(initial_letter, 1)
    testing.expect(t, letter == .C)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__next(initial_letter, 2)
    testing.expect(t, letter == .G)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__next(initial_letter, 3)
    testing.expect(t, letter == .D)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__next(initial_letter, 4)
    testing.expect(t, letter == .A)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__next(initial_letter, 5)
    testing.expect(t, letter == .E)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__next(initial_letter, 6)
    testing.expect(t, letter == .B)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__next(initial_letter, 7)
    testing.expect(t, letter == .F)
    testing.expect(t, resultant_action == .Sharpen)
}

@(test)
test__Letter__prev :: proc(t: ^testing.T) {
    initial_letter: music.NoteLetter = .B
    letter := initial_letter
    resultant_action: music.NoteLetter__ResultantAction

    // automatic iterations
    letter, resultant_action = music.NoteLetter__prev(initial_letter)
    testing.expect(t, letter == .E)
    testing.expect(t, resultant_action == .None)

    // explicit iterations
    letter, resultant_action = music.NoteLetter__prev(initial_letter, 0)
    testing.expect(t, letter == .B)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__prev(initial_letter, 1)
    testing.expect(t, letter == .E)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__prev(initial_letter, 2)
    testing.expect(t, letter == .A)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__prev(initial_letter, 3)
    testing.expect(t, letter == .D)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__prev(initial_letter, 4)
    testing.expect(t, letter == .G)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__prev(initial_letter, 5)
    testing.expect(t, letter == .C)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__prev(initial_letter, 6)
    testing.expect(t, letter == .F)
    testing.expect(t, resultant_action == .None)

    letter, resultant_action = music.NoteLetter__prev(initial_letter, 7)
    testing.expect(t, letter == .B)
    testing.expect(t, resultant_action == .Flatten)
}
