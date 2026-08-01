package sp_music_tests

import "core:testing"

import "sp:music"

@(test)
test__Accidental__sharpen :: proc(t: ^testing.T) {
    accidental: music.Accidental
    err: music.Accidental__Err__sharpen

    accidental = music.Accidental__NATURAL
    accidental, err = music.Accidental__sharpen(accidental)
    testing.expect(t, accidental == 1)
    testing.expect(t, err == .Ok)

    accidental = max(music.Accidental)
    accidental, err = music.Accidental__sharpen(accidental)
    testing.expect(t, err == .AlreadySharpestVariant)
}

@(test)
test__Accidental__flatten :: proc(t: ^testing.T) {
    accidental: music.Accidental
    err: music.Accidental__Err__flatten

    accidental = music.Accidental__NATURAL
    accidental, err = music.Accidental__flatten(accidental)
    testing.expect(t, accidental == -1)
    testing.expect(t, err == .Ok)

    accidental = min(music.Accidental)
    accidental, err = music.Accidental__flatten(accidental)
    testing.expect(t, err == .AlreadyFlattestVariant)
}
