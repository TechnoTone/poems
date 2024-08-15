port module Main exposing (..)

import Browser exposing (Document)
import Browser.Events as Browser
import Browser.Navigation as Navigation
import Html exposing (Html, a, article, footer, h1, h2, header, li, p, section, span, text, ul)
import Html.Attributes exposing (class, href)
import Poems exposing (..)
import String exposing (uncons)
import Url
import Url.Parser as Parser exposing ((</>), Parser, custom, oneOf, top)


type alias Model =
    { key : Navigation.Key
    , page : Page
    }


type Page
    = Home
    | Poem Poem


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


main : Program () Model Msg
main =
    Browser.application
        { init = initModel
        , view = view
        , update = update
        , subscriptions = always Sub.none
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


initModel : flags -> Url.Url -> Navigation.Key -> ( Model, Cmd Msg )
initModel _ url key =
    ( { key = key
      , page = Home
      }
    , Navigation.pushUrl key (Url.toString url)
    )


view : Model -> Document Msg
view model =
    { title = "Poems by Tony Hunt"
    , body =
        case model.page of
            Home ->
                homeView

            Poem poem ->
                poemView poem
    }


homeView : List (Html Msg)
homeView =
    let
        entry : Poem -> Html Msg
        entry poem =
            li
                [ class "poem-entry" ]
                [ a
                    [ href poem.urlPath
                    ]
                    [ span [ class "poem-entry-title" ] [ text poem.title ]
                    , span [ class "poem-entry-date" ] [ text (formatDate poem.written) ]
                    ]
                ]
    in
    [ header [] [ h1 [] [ text "Poems by Tony Hunt" ] ]
    , ul [ class "poems-list" ] (List.map entry Poems.list)
    , footerView
    ]


formatDate : Date -> String
formatDate dmy =
    let
        year =
            dmy // 10000

        month =
            (dmy // 100) |> modBy 100

        monthName =
            case month of
                1 ->
                    "January"

                2 ->
                    "February"

                3 ->
                    "March"

                4 ->
                    "April"

                5 ->
                    "May"

                6 ->
                    "June"

                7 ->
                    "July"

                8 ->
                    "August"

                9 ->
                    "September"

                10 ->
                    "October"

                11 ->
                    "November"

                12 ->
                    "December"

                _ ->
                    "Unknown"

        day =
            dmy |> modBy 100
    in
    String.fromInt day ++ " " ++ monthName ++ " " ++ String.fromInt year


poemView : Poem -> List (Html Msg)
poemView poem =
    [ header []
        [ a [ href "/" ] [ text "Back to list" ]
        , h1 [] [ text poem.title ]
        , h2 [] [ text (formatDate poem.written) ]
        ]
    , article
        [ class "poem" ]
        (List.map stanzaView poem.stanzas)
    , footerView
    ]


stanzaView : Stanza -> Html Msg
stanzaView stanza =
    section
        [ class "stanza" ]
        (List.map lineView stanza)


lineView : String -> Html Msg
lineView line =
    let
        ( firstLetter, restOfLine ) =
            splitFirstLetter line
    in
    p [ class "line" ]
        [ span [ class "first-letter" ] [ text (String.fromChar firstLetter) ]
        , text restOfLine
        ]


splitFirstLetter : String -> ( Char, String )
splitFirstLetter line =
    uncons line |> Maybe.withDefault ( ' ', "" )


footerView : Html Msg
footerView =
    footer []
        [ span [] [ text "© 2024 Tony Hunt, all rights reserved" ] ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked (Browser.Internal url) ->
            ( model
            , Navigation.pushUrl model.key (Url.toString url)
            )

        LinkClicked (Browser.External href) ->
            ( model
            , Navigation.load href
            )

        UrlChanged url ->
            stepUrl url model


stepUrl : Url.Url -> Model -> ( Model, Cmd Msg )
stepUrl url model =
    let
        parser =
            oneOf
                [ route top
                    ( { model | page = Home }, resetTitleAndDescription () )
                , route poemRoute
                    (\poemUrl ->
                        case Poems.get poemUrl of
                            Just match ->
                                ( { model | page = Poem match }
                                , Cmd.batch [ setTitle (match.title ++ " " ++ formatDate match.written), setDescription "A poem by Tony Hunt" ]
                                )

                            Nothing ->
                                ( { model | page = Home }, Cmd.none )
                    )
                ]
    in
    case Parser.parse parser url of
        Just answer ->
            answer

        Nothing ->
            ( { model | page = Home }
            , Cmd.none
            )


route : Parser a b -> a -> Parser (b -> c) c
route parser handler =
    Parser.map handler parser


poemRoute : Parser (String -> a) a
poemRoute =
    custom "POEM_URL" Just


port setTitle : String -> Cmd msg


port setDescription : String -> Cmd msg


port resetTitleAndDescription : () -> Cmd msg
