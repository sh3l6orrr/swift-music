import MusicTheory

print(
    Chord(.DE, .minorTriad).notes,
    Scale(.B, .major).notes,
    Chord(.DE, .minorTriad).isIn(scale: Scale(.B, .major)),
    separator: "\n"
    
)