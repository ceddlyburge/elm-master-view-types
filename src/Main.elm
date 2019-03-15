module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (src, class, classList)
import Html.Events exposing (onClick)
import Route exposing (..)
import NavBarLink exposing (..)
import Banner exposing (..)

---- MODEL ----

type alias Model =
    { route: Route
    }


init : ( Model, Cmd Msg )
init =
    ( Model Home, Cmd.none )


---- UPDATE ----


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
                [ viewHeader homeNavBarLink
                , bannerHtml <| TextBanner <| TextBannerProperties "conduit" "A place to share your knowledge."
                ]
        Article ->
            div 
                []
                [ viewHeader articleNavBarLink
                , bannerHtml <| 
                    ArticleBanner 
                        (Viewer2 "assets/images/smiley-cyrus.jpg" "ginger chicken")
                        (ArticlePreview "How to train your dragon" "February 19, 2019")
                ]
        Viewer ->
            div 
                []
                [ viewHeader viewerNavBarLink
                , bannerHtml <| ViewerBanner <| Viewer2 "assets/images/smiley-cyrus.jpg" "ginger chicken"
                ]

viewHeader : NavBarLink -> Html Msg
viewHeader activeNavBarLink =
    nav [ class "navbar navbar-light" ]
        [ div [ class "container" ]
            [ span [ class "navbar-brand" ]
                [ text "conduit" ]
            , ul 
                [ class "nav navbar-nav pull-xs-right" ]
                (navBarLinksHtml activeNavBarLink)
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
