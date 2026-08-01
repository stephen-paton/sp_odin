package sp_music_tests

import "core:testing"

import "sp:music"

@(test)
test__Letter__next :: proc(t: ^testing.T) {
    initial_letter: music.Letter = .F
    letter := initial_letter

    // automatic iterations
    letter = music.Letter__next(initial_letter)
    testing.expect(t, letter == .C)

    // explicit iterations
    letter = music.Letter__next(initial_letter, 0)
    testing.expect(t, letter == .F)

    letter = music.Letter__next(initial_letter, 1)
    testing.expect(t, letter == .C)

    letter = music.Letter__next(initial_letter, 2)
    testing.expect(t, letter == .G)

    letter = music.Letter__next(initial_letter, 3)
    testing.expect(t, letter == .D)

    letter = music.Letter__next(initial_letter, 4)
    testing.expect(t, letter == .A)

    letter = music.Letter__next(initial_letter, 5)
    testing.expect(t, letter == .E)

    letter = music.Letter__next(initial_letter, 6)
    testing.expect(t, letter == .B)

    letter = music.Letter__next(initial_letter, 7)
    testing.expect(t, letter == .F)
}

@(test)
test__Letter__prev :: proc(t: ^testing.T) {
    initial_letter: music.Letter = .B
    letter := initial_letter

    // automatic iterations
    letter = music.Letter__prev(initial_letter)
    testing.expect(t, letter == .E)

    // explicit iterations
    letter = music.Letter__prev(initial_letter, 0)
    testing.expect(t, letter == .B)

    letter = music.Letter__prev(initial_letter, 1)
    testing.expect(t, letter == .E)

    letter = music.Letter__prev(initial_letter, 2)
    testing.expect(t, letter == .A)

    letter = music.Letter__prev(initial_letter, 3)
    testing.expect(t, letter == .D)

    letter = music.Letter__prev(initial_letter, 4)
    testing.expect(t, letter == .G)

    letter = music.Letter__prev(initial_letter, 5)
    testing.expect(t, letter == .C)

    letter = music.Letter__prev(initial_letter, 6)
    testing.expect(t, letter == .F)

    letter = music.Letter__prev(initial_letter, 7)
    testing.expect(t, letter == .B)
}
