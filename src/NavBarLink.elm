module NavBarLink exposing (NavBarLink, homeNavBarLink, articleNavBarLink, viewerNavBarLink, navBarLinksHtml)

import Html exposing (..)
import Html.Attributes exposing (src, class, classList)
import Html.Events exposing (onClick)
import Route exposing (..)
import Msg exposing (..)

-- NavBarLink is an opaque type, and can only be created using the exported function.
-- This is a useful thing, and means that only supported instances can be created.
-- The downside is that the creation functions (kind of) have to use the specific Msg
-- type, instead of a generic parameter. This isn't completely required, but if you 
-- didn't do it you could create an invalid instance which kind of defeats the point.
-- The upshot of this, is that the pattern is good for use on a particular project,
-- but cannot be shared across projects without refactoring. Which is probably what
-- you want anyway, being as the creation functions are very likely to be project 
-- specific.


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

