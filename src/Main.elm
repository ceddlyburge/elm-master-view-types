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
                , articleBanner
                ]
        Viewer ->
            div 
                []
                [ viewHeader viewerNavBarLink
                , viewerBanner
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

homeBanner : Html Msg
homeBanner =
    div [ class "banner" ]
        [ div [ class "container" ]
            [ h1 [ class "logo-font" ] [ text "conduit" ]
            , p [] [ text "A place to share your knowledge." ]
            ]
        ]


articleBanner : Html Msg
articleBanner =
    div [ class "article-page" ]
        [ div 
            [ class "banner" ]
            [ div [ class "container" ]
                [ h1 [] [ text "How to train your dragon" ]
                , div 
                    [ class "article-meta" ]
                    [ a 
                        [ ]
                        [ img [ src "assets/images/smiley-cyrus.jpg" ] [] ]
                        , div [ class "info" ]
                            [ a 
                                [ class "author" ]
                                [ text "melgenek5" ]
                            , text "February 19, 2019"
                            ]
                    ]
                ]
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
