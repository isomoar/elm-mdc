module Demo.PermanentAboveDrawer exposing
    (
      Model
    , defaultModel
    , Msg(Mdc)
    , update
    , view
    , subscriptions
    )

import Demo.Page as Page exposing (Page)
import Demo.PersistentDrawer
import Html as Html_
import Html.Attributes as Html
import Html exposing (Html, text)
import Json.Decode as Json
import Markdown
import Material
import Material.Button as Button
import Material.Drawer.Permanent as Drawer
import Material.Elevation as Elevation
import Material.Options as Options exposing (styled, cs, css, when)
import Material.Toolbar as Toolbar
import Material.Typography as Typography


type alias Model m =
    { mdc : Material.Model m
    , toggle0 : Bool
    , toggle1 : Bool
    , rtl : Bool
    }


defaultModel : Model m
defaultModel =
    { mdc = Material.defaultModel
    , toggle0 = False
    , toggle1 = False
    , rtl = False
    }


type Msg m
    = Mdc (Material.Msg m)
    | Toggle0
    | Toggle1
    | ToggleRtl


update : (Msg m -> m) -> Msg m -> Model m -> ( Model m, Cmd m )
update lift msg model =
    case msg of
        Mdc msg_ ->
            Material.update (lift << Mdc) msg_ model

        Toggle0 ->
            ( { model | toggle0 = not model.toggle0 }, Cmd.none )

        Toggle1 ->
            ( { model | toggle1 = not model.toggle1 }, Cmd.none )

        ToggleRtl ->
            ( { model | rtl = not model.rtl }, Cmd.none )


view : (Msg m -> m) -> Page m -> Model m -> Html m
view lift page model =
    styled Html.div
    [ cs "demo-body"
    , css "display" "flex"
    , css "flex-direction" "row"
    , css "padding" "0"
    , css "margin" "0"
    , css "box-sizing" "border-box"
    , css "height" "100%"
    , css "width" "100%"
    , Options.attribute (Html.dir "rtl") |> when model.rtl
    ]
    [
      Drawer.view (lift << Mdc) "permanent-above-drawer-drawer" model.mdc []
      [ Drawer.toolbarSpacer [] []
      , Demo.PersistentDrawer.drawerItems
      ]

    , styled Html.div
      [ cs "demo-content"
      , css "display" "inline-flex"
      , css "flex-direction" "column"
      , css "flex-grow" "1"
      , css "height" "100%"
      , css "box-sizing" "border-box"
      ]
      [ Toolbar.view (lift << Mdc) "permanent-above-drawer-toolbar" model.mdc
        [
        ]
        [ Toolbar.row []
          [ Toolbar.section
            [ Toolbar.alignStart
            ]
            [ Toolbar.title
              [ cs "catalog-menu"
              , css "font-family" "'Roboto Mono', monospace"
              , css "margin-left" "8px"
              ]
              [ text "Permanent Drawer Above Toolbar"
              ]
            ]
          ]
        ]

      , styled Html.div
        [ cs "demo-main"
        , css "padding-left" "16px"
        ]
        [
          styled Html.h1
          [ Typography.display1
          ]
          [ text "Permanent Drawer"
          ]
        ,
          styled Html.p
          [ Typography.body2
          ]
          [ text "It sits to the left of this content."
          ]
        ,
          styled Html.div
          [ css "padding" "10px"
          ]
          [
            Button.view (lift << Mdc) "permanent-above-drawer-toggle-rtl" model.mdc
            [ Options.on "click" (Json.succeed (lift ToggleRtl))
            ]
            [ text "Toggle RTL"
            ]
          ]
        ,
          styled Html.div
          [ css "padding" "10px"
          ]
          [
            Button.view (lift << Mdc) "permanent-above-drawer-toggle-extra-wide-content" model.mdc
            [ Options.on "click" (Json.succeed (lift Toggle0))
            ]
            [ text "Toggle extra-wide content"
            ]
          ,
            styled Html.div
            [ css "width" "200vw"
            , css "display" "none" |> when (not model.toggle0)
            , Elevation.z2
            ]
            [ Markdown.toHtml [] "&nbsp;"
            ]
          ]
        ,
          styled Html.div
          [ css "padding" "10px"
          ]
          [
            Button.view (lift << Mdc) "permanent-above-drawer-toggle-extra-tall-content" model.mdc
            [ Options.on "click" (Json.succeed (lift Toggle1))
            ]
            [ text "Toggle extra-tall content"
            ]
          ,
            styled Html.div
            [ css "height" "200vh"
            , css "display" "none" |> when (not model.toggle1)
            , Elevation.z2
            ]
            [ Markdown.toHtml [] "&nbsp;"
            ]
          ]
        ,
          Html.node "style"
          [ Html.type_ "text/css"
          ]
          [ text """
html, body {
  width: 100%;
  height: 100%;
}
            """
          ]
        ]
      ]
    ]


subscriptions : (Msg m -> m) -> Model m -> Sub m
subscriptions lift model =
    Material.subscriptions (lift << Mdc) model
