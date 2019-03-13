module Route exposing (..)

type Route
    = Home
    | Article
    | Viewer

type Page
    = PageHome
    | PageViewer
    | PageArticle


type Msg
    = ShowRoute Route
