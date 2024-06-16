module Main exposing (..)

import Browser exposing (Document)
import Browser.Events as Browser
import Browser.Navigation as Navigation
import Date exposing (Date)
import Html exposing (Html, a, article, button, div, footer, h1, h4, h5, header, span, text)
import Html.Attributes exposing (class, href)
import Poems exposing (..)
import Url
import Url.Parser as Parser exposing ((</>), Parser, custom, fragment, map, oneOf, s, top)


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
initModel flags url key =
    ( { key = key
      , page = Home
      }
    , Cmd.none
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
    div
        []
        [ header []
            [ h1 [] [ text "Poems by Tony Hunt" ]
            ]
        , div [ class "poems-list" ] (List.map homeViewPoemEntry Poems.list)
        , footer []
            [ h5 [] [ text "© 2024 Tony Hunt, all rights reserved" ] ]
        ]


homeViewPoemEntry : Poem -> Html Msg
homeViewPoemEntry poem =
    div
        [ class "poem-entry" ]
        [ a [ href (poemUrl poem.title) ]
            [ span [ class "poem-entry-title" ] [ text poem.title ]
            , span [ class "poem-entry-date" ] [ text (Date.format " (d MMMM y)" poem.written) ]
            ]
        ]


poemView : Poem -> Html Msg
poemView poem =
    div
        [ class "poem" ]
        [ h1 [] [ text poem.title ]
        , h4 [] [ text (Date.format "d MMMM y" poem.written) ]
        , article [ class "poem-text" ] [ text poem.text ]
        , footer []
            [ h5 [] [ text "© 2024 Tony Hunt, all rights reserved" ] ]
        ]


poemUrl : String -> String
poemUrl title =
    title


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        noUpdate : ( Model, Cmd msg )
        noUpdate =
            ( model, Cmd.none )

        updateModel : (Model -> Model) -> ( Model, Cmd msg )
        updateModel fn =
            ( fn model, Cmd.none )
    in
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
        _ =
            Debug.log "stepUrl" (Debug.toString url)

        parser =
            oneOf
                [ route top
                    ( { model | page = Home }, Cmd.none )
                , route poem_
                    (\poem ->
                        case getPoem poem of
                            Just match ->
                                ( { model | page = Poem match }, Cmd.none )

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
    List.head (List.filter (\poem -> poem.title == poemToFind) Poems.list)
