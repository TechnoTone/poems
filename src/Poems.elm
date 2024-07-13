module Poems exposing (..)

import Date exposing (Date, fromCalendarDate)
import Time exposing (Month(..))


type alias Poem =
    { title : String
    , written : Date
    , stanzas : List Stanza
    }


type alias Stanza =
    List String


list : List Poem
list =
    [ Poem
        "Anchor"
        (fromCalendarDate 2024 Jun 4)
        [ [ "Adrift on the ocean, unable to steer,", "unable to navigate, no one else here." ]
        , [ "This feeling of being lost is wearing me down,", "constantly worried that one day I may drown." ]
        , [ "Today, the sky is clear and the water, though vast,", "is calm and serene. But, how long will it last?" ]
        , [ "The wind picks up, and the turbulence grows,", "I try to ride the ebbs and flows." ]
        , [ "The quiet, dark depths, I hear them calling.", "So peaceful, so tranquil, just let go, just fall in." ]
        , [ "It's not real though, I say, don't listen, don't befriend.", "That peace is a lie, it's no answer, it's an end." ]
        , [ "As a storm develops, I look for refuge,", "somewhere to shelter, out of the deluge." ]
        , [ "Exhaustion my companion, my reality, my pain.", "Finally, the turmoil begins to wane." ]
        , [ "Another storm passed, some time to recover.", "But still on this ocean, one day after another." ]
        , [ "An ocean now calm, too often full of anger,", "Seeking escape, seeking safety, seeking help, seeking an anchor." ]
        ]
    , Poem
        "Motivational Words"
        (fromCalendarDate 2024 Jun 11)
        [ [ "Sitting in this room,", "looking at these cards,", "don't know what to write.", "Why is this so hard?" ]
        , [ "Motivational words", "and open questions.", "They don't really resonate", "or inspire, these suggestions." ]
        , [ "I must be tired,", "I just need more rest.", "But why does this happen?", "Oh! Because I'm depressed!" ]
        ]
    , Poem
        "Thought Control"
        (fromCalendarDate 2024 Jun 13)
        [ [ "Supposed to be working, but unable to focus.", "Thoughts so scattered, a chaotic locus.", "We're in control; you can't choke us!", "These thoughts seem to say, but I know that's bogus." ]
        , [ "Perhaps I should sit and meditate.", "It used to help, but not of late.", "So instead, I spiral, degenerate.", "The thoughts persist, perpetuate." ]
        , [ "Distractions help, the thoughts subside,", "But that then leaves me feeling guilty inside.", "Guilt that builds to finally collide", "With the old familiar anxiety, that inexorable tide." ]
        , [ "The thoughts might be gone, but now I'm left", "Broken, sundered, fragmented, cleft.", "Nothing remains, a victim of theft,", "Feeling drained, exhausted, utterly bereft." ]
        ]
    , Poem
        "Father's Day"
        (fromCalendarDate 2024 Jun 16)
        [ [ "The day that you died was, naturally,", "filled with sadness and grief.", "But among these emotions was another,", "an unexpected feeling of relief." ]
        , [ "In many ways, you were gone already,", "dementia slowly taking you away.", "But you weren't gone, you were suffering,", "until that fateful day." ]
        , [ "Towards the end, I couldn't visit,", "it brought me too much pain", "and in you, it only brought confusion,", "so I never visited again." ]
        , [ "Today, I reminisce old times,", "my memories of the past.", "The things we did together,", "The occasions when we laughed." ]
        , [ "I don't miss your jokes or deeds", "or the things that you provided.", "I miss, simply, your presence,", "and the love that once resided." ]
        ]
    ]
