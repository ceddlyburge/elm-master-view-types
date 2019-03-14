module NavBarLink exposing (NavBarLink, homeNavBarLink, articleNavBarLink, viewerNavBarLink, navBarLinksHtml)

import Html exposing (..)
import Html.Attributes exposing (src, class, classList)
import Html.Events exposing (onClick)
import Route exposing (..)

type alias NavBarLinkProperties =
    {    route: Route
        , linkText: String
        , linkClass: String
    }

type NavBarLink =
    NavBarLink NavBarLinkProperties

navBarLinksHtml : NavBarLink -> List (Html Msg)
navBarLinksHtml activeNavBarLink =
    List.map
        (navBarLinkHtml activeNavBarLink)
        [ homeNavBarLink, articleNavBarLink, viewerNavBarLink ]

navBarLinkHtml : NavBarLink -> NavBarLink -> Html Msg
navBarLinkHtml activeNavBarLink navBarLink =
    case navBarLink of 
        NavBarLink navBarLinkProperties ->
            li [ classList [ ( "nav-item", True ), ( "active", navBarLink == activeNavBarLink ) ] ]
            [ a 
                [ class "nav-link", onClick (ShowRoute navBarLinkProperties.route) ] 
                [ 
                    i [ class navBarLinkProperties.linkClass ] []
                    , text navBarLinkProperties.linkText 
                ]
            ]


homeNavBarLink : NavBarLink
homeNavBarLink =
    NavBarLink <| NavBarLinkProperties Route.Home "Home" ""

articleNavBarLink : NavBarLink
articleNavBarLink =
    NavBarLink <| NavBarLinkProperties Route.Article "\u{00A0}Article" "ion-compose"

viewerNavBarLink : NavBarLink
viewerNavBarLink =
    NavBarLink <| NavBarLinkProperties Route.Viewer "\u{00A0}Viewer" "ion-gear-a"

