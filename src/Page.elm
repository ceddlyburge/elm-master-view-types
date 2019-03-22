module Page exposing (Page, pageHtml)

import Html exposing (..)
import Html.Attributes exposing (src, class, classList)
import Html.Events exposing (onClick)
import Route exposing (..)
import NavBarLink exposing (..)
import Banner exposing (..)
import Msg exposing (..)

type alias Page =
    { banner : Banner
    , activeNavBarLink : NavBarLink Msg
    }

pageHtml : Page ->  Html Msg
pageHtml page = 
    div 
        []
        [ viewHeader page.activeNavBarLink
        , bannerHtml page.banner
        ]

viewHeader : NavBarLink Msg -> Html Msg
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
