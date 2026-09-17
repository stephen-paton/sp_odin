package sp_music

Key :: struct {
    type: KeyType,
    using note: Note,
}

Key__new__major :: proc(note: Note) -> (major_key: Key) {
    major_key = { type = .Major, note = note }

    return
}

Key__new__minor :: proc(note: Note) -> (minor_key: Key) {
    minor_key = { type = .Minor, note = note }

    return
}
