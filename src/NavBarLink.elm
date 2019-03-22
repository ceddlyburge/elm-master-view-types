module NavBarLink exposing (NavBarLink, homeNavBarLink, articleNavBarLink, viewerNavBarLink, navBarLinksHtml)

import Html exposing (..)
import Html.Attributes exposing (src, class, classList)
import Html.Events exposing (onClick)
import Route exposing (..)
import Msg exposing (..)

type alias NavBarLinkProperties msg =
    {    msg: msg
        , linkText: String
        , linkClass: String
    }

type NavBarLink msg =
    NavBarLink (NavBarLinkProperties msg)

navBarLinksHtml : NavBarLink Msg -> List (Html Msg)
navBarLinksHtml activeNavBarLink =
    List.map
        (navBarLinkHtml activeNavBarLink)
        [ homeNavBarLink, articleNavBarLink, viewerNavBarLink ]

navBarLinkHtml : NavBarLink Msg -> NavBarLink Msg -> Html Msg
navBarLinkHtml activeNavBarLink navBarLink =
    case navBarLink of 
        NavBarLink navBarLinkProperties ->
            li [ classList [ ( "nav-item", True ), ( "active", navBarLink == activeNavBarLink ) ] ]
            [ a 
                [ class "nav-link", onClick navBarLinkProperties.msg ] 
                [ 
                    i [ class navBarLinkProperties.linkClass ] []
                    , text navBarLinkProperties.linkText 
                ]
            ]


homeNavBarLink : NavBarLink Msg
homeNavBarLink =
    NavBarLink <| NavBarLinkProperties (ShowRoute Route.Home) "Home" ""

articleNavBarLink : NavBarLink Msg
articleNavBarLink =
    NavBarLink <| NavBarLinkProperties (ShowRoute Route.Article) "\u{00A0}Article" "ion-compose"

viewerNavBarLink : NavBarLink Msg
viewerNavBarLink =
    NavBarLink <| NavBarLinkProperties (ShowRoute Route.Viewer) "\u{00A0}Viewer" "ion-gear-a"

