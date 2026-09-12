package sp_music

MinorKey :: enum {
    A,
    E,
    B,
    FSharp,
    CSharp,
    GSharp,
    DSharp,
    ASharp,
    AFlat,
    EFlat,
    BFlat,
    F,
    C,
    G,
    D,
}

MinorKey__get__relative_major :: proc(minor: MinorKey) -> (relative_major: MajorKey) {
    relative_major = MajorKey(int(minor))
    
    return
}
