module Poems exposing (Date, Poem, Stanza, get, list)


type alias Poem =
    { title : String
    , urlPath : String
    , written : Date
    , stanzas : List Stanza
    }


type alias Date =
    Int


type alias Stanza =
    List String


get : String -> Maybe Poem
get urlPath =
    List.head <| List.filter (\p -> p.urlPath == urlPath) list


list : List Poem
list =
    [ Poem
        "Anchor"
        "anchor"
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
        "motivational-words"
        20240611
        [ [ "Sitting in this room,", "looking at these cards,", "don't know what to write.", "Why is this so hard?" ]
        , [ "Motivational words", "and open questions.", "They don't really resonate", "or inspire, these suggestions." ]
        , [ "I must be tired,", "I just need more rest.", "But why does this happen?", "Oh! Because I'm depressed!" ]
        ]
    , Poem
        "Thought Control"
        "thought-control"
        20240613
        [ [ "Supposed to be working, but unable to focus.", "Thoughts so scattered, a chaotic locus.", "We're in control; you can't choke us!", "These thoughts seem to say, but I know that's bogus." ]
        , [ "Perhaps I should sit and meditate.", "It used to help, but not of late.", "So instead, I spiral, degenerate.", "The thoughts persist, perpetuate." ]
        , [ "Distractions help, the thoughts subside,", "But that then leaves me feeling guilty inside.", "Guilt that builds to finally collide", "With the old familiar anxiety, that inexorable tide." ]
        , [ "The thoughts might be gone, but now I'm left", "Broken, sundered, fragmented, cleft.", "Nothing remains, a victim of theft,", "Feeling drained, exhausted, utterly bereft." ]
        ]
    , Poem
        "Father's Day"
        "fathers-day"
        20240616
        [ [ "The day that you died was, naturally,", "filled with sadness and grief.", "But among these emotions was another,", "an unexpected feeling of relief." ]
        , [ "In many ways, you were gone already,", "dementia slowly taking you away.", "But you weren't gone, you were suffering,", "until that fateful day." ]
        , [ "Towards the end, I couldn't visit,", "it brought me too much pain", "and in you, it only brought confusion,", "so I never visited again." ]
        , [ "Today, I reminisce old times,", "my memories of the past.", "The things we did together,", "The occasions when we laughed." ]
        , [ "I don't miss your jokes or deeds", "or the things that you provided.", "I miss, simply, your presence,", "and the love that once resided." ]
        ]
    , Poem
        "Journey"
        "journey"
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
    , Poem
        "Dear Tony"
        "dear-tony"
        20240730
        [ [ "Dear Tony, I'm writing this letter to you today,", "in the hopes that it helps you to find your way." ]
        , [ "I can see that you're struggling with troubles and strife.", "Perhaps this will help you find some light in your life." ]
        , [ "Dark times will happen, from time to time.", "It can be challenging, waiting for the sun to shine." ]
        , [ "Try to remember that it's not going to last.", "Things always improve, like they have in the past." ]
        , [ "These ebbs and flows, these swings of the pendulum,", "they're a cycle, a rhythm, and you know you can ride them." ]
        , [ "You've done it before; you can do it again,", "and each time you do, it takes less and less strain." ]
        , [ "So hang in there Tony, you're doing ok.", "You've got this, you're getting stronger, each and every day." ]
        ]
    , Poem
        "Seed"
        "seed"
        20240814
        [ [ "Today, I'm looking to see some light,", "at the end of the tunnel, that is my plight." ]
        , [ "I hold back the darkness with a candle flame,", "a hobby or interest, a temporary refrain." ]
        , [ "These candles don't last. The flames, they flutter.", "As one goes out, I light up another." ]
        , [ "The candlelight is weak, and this darkness so vast.", "They are all I have, and I'm determined to last." ]
        , [ "Inside me, I feel a light within.", "A seed of brightness that will never grow dim." ]
        , [ "This fragile seed, too small to withstand,", "the darkness around me, too much to demand." ]
        , [ "For now, these candles help me proceed,", "while I protect and nurture this beautiful seed." ]
        , [ "I carry it with me in the hope that, one day,", "it will grow to finally drive the darkness away." ]
        ]
    , Poem
        "Counting"
        "counting"
        20240907
        [ [ "Counting the seconds", "where emotions reside;", "There, they can beckon,", "like a strong rip tide." ]
        , [ "Counting the minutes", "where thoughts may dwell,", "some fleeting snippets,", "others, hard to quell." ]
        , [ "Counting the hours", "where work gets done.", "Flourishing like flowers", "or wilting in the sun." ]
        , [ "Counting the days,", "wary of inaction.", "Looking for ways", "to find satisfaction." ]
        , [ "Counting the weeks", "as we rush around.", "Some pass in streaks,", "others run aground." ]
        , [ "Counting the months,", "seeking fulfilment.", "Challenges confront,", "and we hold with commitment." ]
        , [ "Counting the years,", "and the wisdom they bring,", "from blood, sweat and tears,", "and a refusal to give in." ]
        , [ "Counting the decades,", "reminiscing lost youth.", "Memory fades;", "We can't fight the truth." ]
        , [ "Counting my blessings,", "I'm still here today.", "Sometimes, with no bearings,", "but I'm still finding my way." ]
        ]
    , Poem
        "Calm"
        "calm"
        20241015
        [ [ "The calm before the storm;", "a familiar feeling.", "Learning to recognise", "when my mood starts reeling." ]
        , [ "The calm in the eye", "of the storm as it flails.", "Holding myself tall,", "resisting the gales." ]
        , [ "The calm afterwards;", "a sense of relief.", "Time to rest and recover,", "however brief." ]
        ]
    , Poem
        "Colours"
        "colours"
        20241024
        [ [ "Blue is the mood", "that I'm constantly hiding.", "Cover it with smiles", "and pretend that I'm thriving." ]
        , [ "Black is the knot", "of anxiety in my core.", "Tearing me apart,", "always wanting more." ]
        , [ "Red is the anger", "and frustration with myself,", "with this situation,", "with my poor mental health." ]
        , [ "Yellow is the compassion", "I try to find", "for myself as I struggle", "inside my mind." ]
        , [ "Green is the peace", "and tranquillity I feel", "on rare occasions,", "so full of appeal." ]
        , [ "White is the strength,", "the life, the vitality,", "that I see in others,", "but in me, lacks opacity." ]
        ]
    , Poem
        "Sands of time"
        "sands-of-time"
        20241029
        [ [ "The sands of time keep falling;", "a whirlpool in slow motion.", "The reservoir slowly empties;", "a steady and inevitable erosion." ]
        , [ "Through the centre, they each fall;", "the grains become isolated.", "Their brief moment in the light,", "their glory illuminated." ]
        , [ "Delicately, they tumble down,", "landing amongst each other.", "Layer upon layer of memories;", "a tapestry of light and colour." ]
        ]
    , Poem
        "Contradictions"
        "contradictions"
        20241103
        [ [ "Never really alone;", "friends and family all around.", "Never really alone,", "yet loneliness abounds." ]
        , [ "The world is full of colour;", "beautiful sights to delight.", "The world is full of colour;", "only seen in black and white." ]
        , [ "A symphony of sound;", "an orchestra of life in action.", "A symphony of sound;", "a constantly buzzing distraction." ]
        , [ "The universe is full of energy,", "a wonder to behold.", "The universe is full of energy,", "but still, I feel so cold." ]
        ]
    , Poem
        "Pause"
        "pause"
        20241115
        [ [ "Make time, take time, to pause, to breathe,"
          , "a time to take stock, a short reprieve,"
          , "a moment of awareness, immersed in the presence,"
          , "to fully connect with peace and quiescence."
          ]
        ]
    , Poem
        "Beginnings"
        "beginnings"
        20241210
        [ [ "Beginning to see the light at the end of this tunnel.", "Stepping out of this darkness, away from this struggle." ]
        , [ "Beginning to see the edge of this dark forest.", "A way out of these trees full of torment and menace." ]
        , [ "Beginning to reach the end of this storm.", "Blue sky ahead, a gentle breeze so warm." ]
        , [ "Any of these beginnings would be a welcome relief.", "But thinking about them only makes me frustrated and angry." ]
        ]
    , Poem
        "Fractured"
        "fractured"
        20250129
        [ [ "Fractured, scattered,", "incoherent thoughts,", "a storm in my head." ]
        , [ "Physically numb,", "emotionless except,", "anxiety and dread." ]
        , [ "Apathetic, lethargic,", "living seems pointless,", "but afraid to be dead." ]
        ]
    , Poem
        "Alone"
        "alone"
        20250130
        [ [ "In the woods by myself, or at home, or with friends;"
          , "always alone, in my thoughts, without end."
          ]
        , [ "Repeated attempts to engage with connections,"
          , "feels like nothing more than feeble distractions."
          ]
        , [ "But alone with these thoughts, I try to remind"
          , "myself that this is just my state of mind."
          ]
        ]
    , Poem
        "Existential Thoughts"
        "existential-thoughts"
        20250318
        [ [ "Nihilistic thoughts keep plaguing my mind;"
          , "constantly swirling, combined and aligned;"
          , "wearing me down, this incessant grind."
          , "I wish I could leave these thoughts behind."
          ]
        , [ "People around me, all living, all dying."
          , "The universe doesn't care, so why are we trying"
          , "to find a purpose, a sense of thriving?"
          , "But to me, it's a fallacy, a delusion of lying."
          ]
        , [ "Why are we here? What is it all for?"
          , "I can't see the point of anything any more."
          , "A sense of futility deep in my core."
          , "A battle in my mind, an eternal war."
          ]
        , [ "I look back at the path that brought me here,"
          , "full of anger, anxiety, depression and fear."
          , "But with self-realisation and understanding, it's clear;"
          , "I'll keep striving and finding a way to persevere."
          ]
        , [ "The path in front of me is blocked by a door,"
          , "this one more massive than the one before."
          , "Through it, another revelation to explore."
          , "Another facet to add to my personal lore."
          ]
        , [ "Uncharted territory remains a constant attraction;"
          , "a desire to grow, a call to action."
          , "Whatever I find, I must not abandon,"
          , "so these existential thoughts are my new companion."
          ]
        ]
    ]



-- fromString : String -> List Stanza
-- fromString =
--     String.trim
--         >> String.replace "\u{000D}\n" "\n"
--         >> String.split "\n\n"
--         >> List.map (String.lines >> List.map String.trim)
--         >> Debug.log "Stanzas"
