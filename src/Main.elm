module Main exposing (..)

import Browser
import Html exposing (..)
import Route exposing (..)
import NavBarLink exposing (..)
import Banner exposing (..)
import Page exposing (..)
import Msg exposing (..)

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
    pageHtml <| page model

page : Model -> Page
page model =
    case model.route of
        Home ->
            Page
                (TextBanner <| TextBannerProperties "conduit" "A place to share your knowledge.")
                homeNavBarLink 
        Article ->
            Page
                (ArticleBanner 
                        (Banner.Viewer "assets/images/smiley-cyrus.jpg" "ginger chicken")
                        (ArticlePreview "How to train your dragon" "February 19, 2019")
                )
                articleNavBarLink
        Route.Viewer ->
            Page 
                (ViewerBanner <| Banner.Viewer "assets/images/smiley-cyrus.jpg" "ginger chicken")
                viewerNavBarLink
                

---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
