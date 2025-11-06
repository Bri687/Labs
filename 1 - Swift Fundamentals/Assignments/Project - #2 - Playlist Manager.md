---
id: B2846EEB-0142-42D6-BA91-1CF1B96A9B57
name: #2 - Playlist Manager
type: project
assignDay: SF17
dueDay: SF19
location: 
---

# #2 - Playlist Manager Project Requirements - Due Sep 9, 2025

## Playlist Manager

Your task is to build a playlist manager Playground. Using a Song struct and Playlist class, the core of your app will be an array of playlists. The Playlist class should include a minimum of four properties `name`, `author`, `songs`, and `currentlyPlaying`, as well as the following functions:

```swift
// Init
init()

// Core mutation
func add(_ song: Song)
func remove(at index: Int)
func clear()

// Querying / reading
var count: Int { get }
func allSongs() -> [Song]
func totalDuration() -> Int
func currentSong() -> Song?

// Playback navigation
func play(at index: Int) -> Song?
func playNext() -> Song?
func playPrevious() -> Song?

// Shuffle
func shuffle()
```

When "playing" a song, you can simply output it to the console.
## Black Diamond

- Add sorting features that allow users to reorder the playlist by duration, song name, artist name, and any other properties you'd like.
- Also allow for custom rearranging of the playlist with a function along the lines of `func move(song: Song, to index: Int)`.