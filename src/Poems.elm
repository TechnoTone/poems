module Poems exposing (..)


type alias Poem =
    { title : String
    , written : Date
    , stanzas : List Stanza
    }


type alias Date =
    Int


type alias Stanza =
    List String


list : List Poem
list =
    [ Poem
        "Anchor"
        20240604
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
        20240611
        [ [ "Sitting in this room,", "looking at these cards,", "don't know what to write.", "Why is this so hard?" ]
        , [ "Motivational words", "and open questions.", "They don't really resonate", "or inspire, these suggestions." ]
        , [ "I must be tired,", "I just need more rest.", "But why does this happen?", "Oh! Because I'm depressed!" ]
        ]
    , Poem
        "Thought Control"
        20240613
        [ [ "Supposed to be working, but unable to focus.", "Thoughts so scattered, a chaotic locus.", "We're in control; you can't choke us!", "These thoughts seem to say, but I know that's bogus." ]
        , [ "Perhaps I should sit and meditate.", "It used to help, but not of late.", "So instead, I spiral, degenerate.", "The thoughts persist, perpetuate." ]
        , [ "Distractions help, the thoughts subside,", "But that then leaves me feeling guilty inside.", "Guilt that builds to finally collide", "With the old familiar anxiety, that inexorable tide." ]
        , [ "The thoughts might be gone, but now I'm left", "Broken, sundered, fragmented, cleft.", "Nothing remains, a victim of theft,", "Feeling drained, exhausted, utterly bereft." ]
        ]
    , Poem
        "Father's Day"
        20240616
        [ [ "The day that you died was, naturally,", "filled with sadness and grief.", "But among these emotions was another,", "an unexpected feeling of relief." ]
        , [ "In many ways, you were gone already,", "dementia slowly taking you away.", "But you weren't gone, you were suffering,", "until that fateful day." ]
        , [ "Towards the end, I couldn't visit,", "it brought me too much pain", "and in you, it only brought confusion,", "so I never visited again." ]
        , [ "Today, I reminisce old times,", "my memories of the past.", "The things we did together,", "The occasions when we laughed." ]
        , [ "I don't miss your jokes or deeds", "or the things that you provided.", "I miss, simply, your presence,", "and the love that once resided." ]
        ]
    , Poem
        "Journey"
        20240723
        [ [ "Not so very many years ago", "I was unaware of what grew beneath", "the surface of my awareness.", "Depression was sinking in its teeth." ]
        , [ "Struggling through each day,", "a blur of chronic pain,", "medication numbed my senses,", "as this condition altered my brain." ]
        , [ "Eventually, the pain subsided,", "lessened by time and knowledge.", "The drugs were no longer necessary;", "without them, I could now manage." ]
        , [ "I enjoyed this restoration,", "and a brightness returned within.", "Alas, I soon realised,", "it was dimmer than it once had been." ]
        , [ "But it wasn't the passage of a decade", "that shadows my mind like a cloud.", "Something worse was suffocating,", "smothering me with its shroud." ]
        , [ "First, it brought anxiety,", "gripping with a sickening dread.", "No escape and no explanation,", "it was coming from my own head." ]
        , [ "With acceptance and familiarity", "I took away its power.", "It still simmers in the background", "Every minute, every hour." ]
        , [ "But opening this inner dialogue,", "plunging depths I didn't know existed,", "I encountered a hidden monster", "a part of me, dark and twisted." ]
        , [ "Surging to the surface,", "these thoughts I'd never had,", "feelings of utter despair,", "overwhelming and intolerably sad." ]
        , [ "I'm glad I opened this fissure", "to this chasm hiding below.", "I'm glad I learned it was there", "before it swallowed me whole." ]
        , [ "Striving and working to understand,", "to accept, to learn, to grow.", "I'm continuing on this journey", "and will see where next it may go." ]
        ]
    ]
