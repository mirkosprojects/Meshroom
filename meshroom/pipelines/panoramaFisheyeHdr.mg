{
    "header": {
        "nodesVersions": {
            "PanoramaCompositing": "2.0",
            "SfMTransform": "3.1",
            "PanoramaPrepareImages": "1.1",
            "FeatureExtraction": "1.2",
            "Publish": "1.3",
            "LdrToHdrMerge": "4.1",
            "CameraInit": "9.0",
            "FeatureMatching": "2.0",
            "PanoramaMerging": "1.0",
            "PanoramaWarping": "1.1",
            "LdrToHdrSampling": "4.0",
            "ImageMatching": "2.0",
            "PanoramaPostProcessing": "1.0",
            "PanoramaSeams": "2.0",
            "LdrToHdrCalibration": "3.0",
            "PanoramaEstimation": "1.0",
            "PanoramaInit": "2.0"
        },
        "releaseVersion": "2023.2.0",
        "fileVersion": "1.1",
        "template": true
    },
    "graph": {
        "LdrToHdrMerge_1": {
            "nodeType": "LdrToHdrMerge",
            "position": [
                800,
                0
            ],
            "inputs": {
                "input": "{LdrToHdrCalibration_1.input}",
                "response": "{LdrToHdrCalibration_1.response}",
                "userNbBrackets": "{LdrToHdrCalibration_1.userNbBrackets}",
                "byPass": "{LdrToHdrCalibration_1.byPass}",
                "channelQuantizationPower": "{LdrToHdrCalibration_1.channelQuantizationPower}",
                "workingColorSpace": "{LdrToHdrCalibration_1.workingColorSpace}"
            }
        },
        "PanoramaWarping_1": {
            "nodeType": "PanoramaWarping",
            "position": [
                2200,
                0
            ],
            "inputs": {
                "input": "{SfMTransform_1.output}"
            }
        },
        "LdrToHdrCalibration_1": {
            "nodeType": "LdrToHdrCalibration",
            "position": [
                600,
                0
            ],
            "inputs": {
                "input": "{LdrToHdrSampling_1.input}",
                "samples": "{LdrToHdrSampling_1.output}",
                "userNbBrackets": "{LdrToHdrSampling_1.userNbBrackets}",
                "byPass": "{LdrToHdrSampling_1.byPass}",
                "calibrationMethod": "{LdrToHdrSampling_1.calibrationMethod}",
                "channelQuantizationPower": "{LdrToHdrSampling_1.channelQuantizationPower}",
                "workingColorSpace": "{LdrToHdrSampling_1.workingColorSpace}"
            }
        },
        "LdrToHdrSampling_1": {
            "nodeType": "LdrToHdrSampling",
            "position": [
                400,
                0
            ],
            "inputs": {
                "input": "{PanoramaPrepareImages_1.output}"
            }
        },
        "ImageMatching_1": {
            "nodeType": "ImageMatching",
            "position": [
                1400,
                0
            ],
            "inputs": {
                "input": "{PanoramaInit_1.outSfMData}",
                "featuresFolders": [
                    "{FeatureExtraction_1.output}"
                ],
                "method": "FrustumOrVocabularyTree"
            }
        },
        "FeatureExtraction_1": {
            "nodeType": "FeatureExtraction",
            "position": [
                1000,
                0
            ],
            "inputs": {
                "input": "{LdrToHdrMerge_1.outSfMData}",
                "describerTypes": [
                    "sift"
                ],
                "describerPreset": "high",
                "describerQuality": "high"
            }
        },
        "PanoramaMerging_1": {
            "nodeType": "PanoramaMerging",
            "position": [
                2800,
                0
            ],
            "inputs": {
                "input": "{PanoramaCompositing_1.input}",
                "compositingFolder": "{PanoramaCompositing_1.output}",
                "useTiling": "{PanoramaCompositing_1.useTiling}"
            }
        },
        "PanoramaCompositing_1": {
            "nodeType": "PanoramaCompositing",
            "position": [
                2600,
                0
            ],
            "inputs": {
                "input": "{PanoramaSeams_1.outputSfm}",
                "warpingFolder": "{PanoramaSeams_1.warpingFolder}",
                "labels": "{PanoramaSeams_1.output}",
                "useTiling": false
            }
        },
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                0,
                0
            ],
            "inputs": {
                "allowedCameraModels": [
                    "pinhole",
                    "radial1",
                    "radial3",
                    "brown",
                    "fisheye1",
                    "3deanamorphic4",
                    "3deradial4",
                    "3declassicld"
                ]
            }
        },
        "PanoramaPostProcessing_1": {
            "nodeType": "PanoramaPostProcessing",
            "position": [
                3000,
                0
            ],
            "inputs": {
                "inputPanorama": "{PanoramaMerging_1.outputPanorama}",
                "fillHoles": true
            }
        },
        "PanoramaPrepareImages_1": {
            "nodeType": "PanoramaPrepareImages",
            "position": [
                200,
                0
            ],
            "inputs": {
                "input": "{CameraInit_1.output}"
            }
        },
        "SfMTransform_1": {
            "nodeType": "SfMTransform",
            "position": [
                2000,
                0
            ],
            "inputs": {
                "input": "{PanoramaEstimation_1.output}",
                "method": "manual"
            }
        },
        "PanoramaSeams_1": {
            "nodeType": "PanoramaSeams",
            "position": [
                2400,
                0
            ],
            "inputs": {
                "input": "{PanoramaWarping_1.input}",
                "warpingFolder": "{PanoramaWarping_1.output}"
            }
        },
        "PanoramaEstimation_1": {
            "nodeType": "PanoramaEstimation",
            "position": [
                1800,
                0
            ],
            "inputs": {
                "input": "{FeatureMatching_1.input}",
                "featuresFolders": "{FeatureMatching_1.featuresFolders}",
                "matchesFolders": [
                    "{FeatureMatching_1.output}"
                ],
                "describerTypes": "{FeatureMatching_1.describerTypes}"
            }
        },
        "PanoramaInit_1": {
            "nodeType": "PanoramaInit",
            "position": [
                1200,
                0
            ],
            "inputs": {
                "input": "{FeatureExtraction_1.input}",
                "dependency": [
                    "{FeatureExtraction_1.output}"
                ],
                "useFisheye": true
            }
        },
        "FeatureMatching_1": {
            "nodeType": "FeatureMatching",
            "position": [
                1600,
                0
            ],
            "inputs": {
                "input": "{ImageMatching_1.input}",
                "featuresFolders": "{ImageMatching_1.featuresFolders}",
                "imagePairsList": "{ImageMatching_1.output}",
                "describerTypes": "{FeatureExtraction_1.describerTypes}"
            }
        },
        "Publish_1": {
            "nodeType": "Publish",
            "position": [
                3200,
                0
            ],
            "inputs": {
                "inputFiles": [
                    "{PanoramaPostProcessing_1.outputPanorama}"
                ]
            }
        }
    }
}