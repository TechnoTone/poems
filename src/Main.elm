port module Main exposing (..)

import Browser exposing (Document)
import Browser.Events as Browser
import Browser.Navigation as Navigation
import Date exposing (Date)
import Html exposing (Html, a, article, div, footer, h1, h2, header, span, text)
import Html.Attributes exposing (class, href)
import Poems exposing (..)
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
        [ case model.page of
            Home ->
                homeView

            Poem poem ->
                poemView poem
        ]
    }


homeView : Html Msg
homeView =
    let
        entry : Poem -> Html Msg
        entry poem =
            a
                [ href (poemUrl poem.title)
                ]
                [ div [ class "poem-entry" ]
                    [ span [ class "poem-entry-title" ] [ text poem.title ]
                    , span [ class "poem-entry-date" ] [ text (formatDate poem.written) ]
                    ]
                ]
    in
    div
        []
        [ header []
            [ h1 [] [ text "Poems by Tony Hunt" ]
            ]
        , div [ class "poems-list" ] (List.map entry Poems.list)
        , footerView
        ]


formatDate : Date -> String
formatDate =
    Date.format " (d MMMM y)"


poemView : Poem -> Html Msg
poemView poem =
    div
        [ class "poem" ]
        [ a [ href "/" ] [ text "Back to list" ]
        , h1 [] [ text poem.title ]
        , h2 [] [ text (Date.format "d MMMM y" poem.written) ]
        , article [ class "poem-text" ] [ text poem.text ]
        , footerView
        ]


footerView : Html Msg
footerView =
    footer []
        [ span [] [ text "© 2024 Tony Hunt, all rights reserved" ] ]


poemUrl : String -> String
poemUrl title =
    title


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
                , route poem_
                    (\poem ->
                        case getPoem poem of
                            Just match ->
                                ( { model | page = Poem match }
                                , Cmd.batch [ setTitle (match.title ++ formatDate match.written), setDescription "A poem by Tony Hunt" ]
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


poem_ : Parser (String -> a) a
poem_ =
    custom "POEM" Just


getPoem : String -> Maybe Poem
getPoem poemToFind =
    List.head
        (List.filter
            (matches poemToFind)
            Poems.list
        )


matches : String -> Poem -> Bool
matches title poem =
    title == String.replace " " "%20" poem.title


port setTitle : String -> Cmd msg


port setDescription : String -> Cmd msg


port resetTitleAndDescription : () -> Cmd msg
