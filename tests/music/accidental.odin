package sp_music_tests

import "core:testing"

import "sp:music"

@(test)
test__Accidental__try_get__sharpened :: proc(t: ^testing.T) {
    accidental: music.Accidental
    err: music.Accidental__Err__try_get__sharpened

    accidental = music.Accidental__NATURAL
    accidental, err = music.Accidental__try_get__sharpened(accidental)
    testing.expect(t, accidental == 1)
    testing.expect(t, err == .Ok)

    accidental = max(music.Accidental)
    accidental, err = music.Accidental__try_get__sharpened(accidental)
    testing.expect(t, err == .AlreadySharpestVariant)
}

@(test)
test__Accidental__try_get__flattened :: proc(t: ^testing.T) {
    accidental: music.Accidental
    err: music.Accidental__Err__try_get__flattened

    accidental = music.Accidental__NATURAL
    accidental, err = music.Accidental__try_get__flattened(accidental)
    testing.expect(t, accidental == -1)
    testing.expect(t, err == .Ok)

    accidental = min(music.Accidental)
    accidental, err = music.Accidental__try_get__flattened(accidental)
    testing.expect(t, err == .AlreadyFlattestVariant)
}
