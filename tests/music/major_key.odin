package sp_music_tests

import "core:testing"

import "sp:music"

@(test)
test__MajorKey__get__relative_minor :: proc(t: ^testing.T) {
    major: music.MajorKey
    relative_minor: music.MinorKey

    major = .C
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .A)

    major = .G
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .E)

    major = .D
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .B)

    major = .A
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .FSharp)

    major = .E
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .CSharp)

    major = .B
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .GSharp)

    major = .FSharp
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .DSharp)

    major = .CSharp
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .ASharp)

    major = .CFlat
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .AFlat)

    major = .GFlat
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .EFlat)

    major = .DFlat
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .BFlat)

    major = .AFlat
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .F)

    major = .EFlat
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .C)

    major = .BFlat
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .G)

    major = .F
    relative_minor = music.MajorKey__get__relative_minor(major)
    testing.expect(t, relative_minor == .D)
}
