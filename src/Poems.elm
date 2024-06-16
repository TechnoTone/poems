module Poems exposing (..)

import Date exposing (Date, fromCalendarDate)
import Time exposing (Month(..))


type alias Poem =
    { title : String
    , written : Date
    , text : String
    }


list : List Poem
list =
    [ Poem
        "Anchor"
        (fromCalendarDate 2024 Jun 4)
        (String.trim """
Adrift on the ocean, unable to steer,
unable to navigate, no one else here.

This feeling of being lost is wearing me down,
constantly worried that one day I may drown.

Today, the sky is clear and the water, though vast,
is calm and serene. But, how long will it last? 

The wind picks up, and the turbulence grows,
I try to ride the ebbs and flows.

The quiet, dark depths, I hear them calling.
So peaceful, so tranquil, just let go, just fall in.

It's not real though, I say, don't listen, don't befriend.
That peace is a lie, it's no answer, it's an end.

As a storm develops, I look for refuge,
somewhere to shelter, out of the deluge.

Exhaustion my companion, my reality, my pain.
Finally, the turmoil begins to wane.

Another storm passed, some time to recover.
But still on this ocean, one day after another.

An ocean now calm, too often full of anger,
Seeking escape, seeking safety, seeking help, seeking an anchor.
""")
    ]
