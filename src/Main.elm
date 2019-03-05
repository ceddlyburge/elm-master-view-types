module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (src, class, classList)
import Html.Events exposing (onClick)


---- MODEL ----

type Route
    = Home
    | Article
    | Viewer

type Page
    = PageHome
    | PageViewer
    | PageArticle


type alias Model =
    { route: Route
    }


init : ( Model, Cmd Msg )
init =
    ( Model Home, Cmd.none )



---- UPDATE ----


type Msg
    = ShowRoute Route


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ShowRoute route ->
            ( { model | route = route }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    case model.route of
        Home ->
            div 
                []
                [ viewHeader PageHome
                , homeBanner
                ]
        Article ->
            div []
                [ img [ src "/logo.svg" ] []
                , h1 [] [ text "Your Elm App is working!" ]
                ]
        Viewer ->
            div 
                []
                [ viewHeader PageViewer
                , viewerBanner
                ]

viewHeader : Page -> Html Msg
viewHeader page =
    nav [ class "navbar navbar-light" ]
        [ div [ class "container" ]
            [ span [ class "navbar-brand" ]
                [ text "conduit" ]
            , ul 
                [ class "nav navbar-nav pull-xs-right" ]
                [
                navbarLink page Home [ text "Home" ]
                , navbarLink page Article [ i [ class "ion-compose" ] [], text "\u{00A0}Article" ]
                , navbarLink page  Viewer [ i [ class "ion-gear-a" ] [], text "\u{00A0}Viewer" ]
                ]
            ]
        ]

navbarLink : Page -> Route -> List (Html Msg) -> Html Msg
navbarLink page route linkContent =
    li [ classList [ ( "nav-item", True ), ( "active", isActive page route ) ] ]
    [ a [ class "nav-link", onClick (ShowRoute route) ] linkContent ]

isActive : Page -> Route -> Bool
isActive page route =
    case ( page, route ) of
        ( PageHome, Home ) ->
            True

        ( PageViewer, Viewer ) ->
            True

        ( PageArticle, Article ) ->
            True

        _ ->
            False

homeBanner : Html Msg
homeBanner =
    div [ class "banner" ]
        [ div [ class "container" ]
            [ h1 [ class "logo-font" ] [ text "conduit" ]
            , p [] [ text "A place to share your knowledge." ]
            ]
        ]


viewerBanner : Html Msg
viewerBanner =
    div 
        [ class "profile-page" ]
        [ div 
            [ class "user-info" ]
            [ div [ class "container" ]
                [ div [ class "row" ]
                    [ div [ class "col-xs-12 col-md-10 offset-md-1" ]
                        [ img [ class "user-img", src "assets/images/smiley-cyrus.jpg" ] []
                        , h4 [] [ text "gingerchicken" ]
                        , p [] [ text "" ]
                        --, followButton
                        ]
                    ]
                ]
            ]
        ]


---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
