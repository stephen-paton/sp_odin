package sp_music_tests

import "core:testing"

import "sp:music"

@(test)
test__MinorKey__get__relative_major :: proc(t: ^testing.T) {
    minor: music.MinorKey
    relative_major: music.MajorKey

    minor = .A
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .C)

    minor = .E
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .G)

    minor = .B
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .D)

    minor = .FSharp
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .A)

    minor = .CSharp
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .E)

    minor = .GSharp
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .B)

    minor = .DSharp
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .FSharp)

    minor = .ASharp
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .CSharp)

    minor = .AFlat
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .CFlat)

    minor = .EFlat
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .GFlat)

    minor = .BFlat
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .DFlat)

    minor = .F
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .AFlat)

    minor = .C
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .EFlat)

    minor = .G
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .BFlat)

    minor = .D
    relative_major = music.MinorKey__get__relative_major(minor)
    testing.expect(t, relative_major == .F)
}
