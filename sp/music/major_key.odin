package sp_music

MajorKey :: enum {
    C,
    G,
    D,
    A,
    E,
    B,
    FSharp,
    CSharp,
    CFlat,
    GFlat,
    DFlat,
    AFlat,
    EFlat,
    BFlat,
    F,
}

MajorKey__get__relative_minor :: proc(major: MajorKey) -> (relative_minor: MinorKey) {
    relative_minor = MinorKey(int(major))
    
    return
}
