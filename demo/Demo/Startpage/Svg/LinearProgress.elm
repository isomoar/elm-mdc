module Demo.Startpage.Svg.LinearProgress exposing (view)

import Html exposing (Html)
import Svg exposing (defs, desc, g, mask, rect, svg, text, title, use)
import Svg.Attributes exposing (fill, fillRule, height, id, opacity, rx, stroke, strokeWidth, transform, version, viewBox, width, x, xlinkHref, y)


view : Html msg
view =
    svg [ viewBox "0 0 180 180", version "1.1" ]
        [ title []
            [ text "linear_progress_180px" ]
        , desc []
            [ text "Created with Sketch." ]
        , defs []
            [ rect [ id "__1BRA3wQ__path-1", x "0", y "0", width "180", height "180" ]
                []
            , rect [ id "__1BRA3wQ__path-3", x "0", y "0", width "200", height "8", rx "4" ]
                []
            , rect [ id "__1BRA3wQ__path-5", x "0", y "0", width "92", height "8", rx "4" ]
                []
            ]
        , g [ id "__1BRA3wQ__linear_progress_180px", stroke "none", strokeWidth "1", fill "none", fillRule "evenodd" ]
            [ g [ id "__1BRA3wQ__Dialog-/-Header-Copy-27" ]
                [ mask [ id "__1BRA3wQ__mask-2", fill "white" ]
                    [ use [ xlinkHref "#__1BRA3wQ__path-1" ]
                        []
                    ]
                , use [ id "__1BRA3wQ__Mask", fill "#FAFAFA", xlinkHref "#__1BRA3wQ__path-1" ]
                    []
                , g [ id "__1BRA3wQ__Progress-Indicators-/-Linear", Svg.Attributes.mask "url(#__1BRA3wQ__mask-2)" ]
                    [ g [ transform "translate(30.000000, 86.000000)" ]
                        [ g [ id "__1BRA3wQ__Progress-Indicators-/-Elements-/-Linear-/-Track" ]
                            [ mask [ id "__1BRA3wQ__mask-4", fill "white" ]
                                [ use [ xlinkHref "#__1BRA3wQ__path-3" ]
                                    []
                                ]
                            , g [ id "__1BRA3wQ__Surface" ]
                                []
                            , g [ id "__1BRA3wQ__?-/-Color-/-Primary-/-Main", opacity "0.24", Svg.Attributes.mask "url(#__1BRA3wQ__mask-4)", fill "#212121", fillRule "evenodd" ]
                                [ g [ id "__1BRA3wQ__?-/-Color-/-Primary-/-500" ]
                                    [ rect [ id "__1BRA3wQ__Rectangle-13", x "0", y "0", width "200", height "8" ]
                                        []
                                    ]
                                ]
                            ]
                        , g [ id "__1BRA3wQ__Progress-Indicators-/-Elements-/-Linear-/-Indicator" ]
                            [ mask [ id "__1BRA3wQ__mask-6", fill "white" ]
                                [ use [ xlinkHref "#__1BRA3wQ__path-5" ]
                                    []
                                ]
                            , g [ id "__1BRA3wQ__Surface" ]
                                []
                            , g [ id "__1BRA3wQ__?-/-Color-/-Primary-/-Main", Svg.Attributes.mask "url(#__1BRA3wQ__mask-6)", fill "#212121", fillRule "evenodd" ]
                                [ g [ id "__1BRA3wQ__?-/-Color-/-Primary-/-500" ]
                                    [ rect [ id "__1BRA3wQ__Rectangle-13", x "0", y "0", width "92", height "8" ]
                                        []
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
