module NavBarLink exposing (NavBarLink, homeNavBarLink, articleNavBarLink, viewerNavBarLink, navBarLinksHtml, navBarLinkForRoute)

import Html exposing (..)
import Html.Attributes exposing (src, class, classList)
import Html.Events exposing (onClick)
import Route exposing (..)

type NavBarLink =
    NavBarLink Route String String

navBarLinksHtml : NavBarLink -> List (Html Msg)
navBarLinksHtml activeNavBarLink =
    List.map
        (navBarLinkHtml activeNavBarLink)
        [ homeNavBarLink, articleNavBarLink, viewerNavBarLink ]

navBarLinkHtml : NavBarLink -> NavBarLink -> Html Msg
navBarLinkHtml activeNavBarLink navBarLink =
    case navBarLink of 
        NavBarLink route linkText linkClass ->
            li [ classList [ ( "nav-item", True ), ( "active", navBarLink == activeNavBarLink ) ] ]
            [ a 
                [ class "nav-link", onClick (ShowRoute route) ] 
                [ 
                    i [ class linkClass ] []
                    , text linkText 
                ]
            ]


navBarLinkForRoute : Route -> NavBarLink
navBarLinkForRoute route =
    case ( route ) of
        Home  ->
            NavBarLink Route.Home "Home" ""

        Viewer ->
            NavBarLink Route.Viewer "\u{00A0}Viewer" "ion-gear-a"

        Article ->
            NavBarLink Route.Article "\u{00A0}Article" "ion-compose"


homeNavBarLink : NavBarLink
homeNavBarLink =
    NavBarLink Route.Home "Home" ""

articleNavBarLink : NavBarLink
articleNavBarLink =
    NavBarLink Route.Article "\u{00A0}Article" "ion-compose"

viewerNavBarLink : NavBarLink
viewerNavBarLink =
    NavBarLink Route.Viewer "\u{00A0}Viewer" "ion-gear-a"

