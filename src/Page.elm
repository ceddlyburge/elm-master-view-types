module Page exposing (Page2, pageHtml)

import Html exposing (..)
import Html.Attributes exposing (src, class, classList)
import Html.Events exposing (onClick)
import Route exposing (..)
import NavBarLink exposing (..)
import Banner exposing (..)

type alias Page2 =
    { banner : Banner
    , activeNavBarLink : NavBarLink 
    }

pageHtml : Page2 ->  Html Msg
pageHtml page = 
    div 
        []
        [ viewHeader page.activeNavBarLink
        , bannerHtml page.banner
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
