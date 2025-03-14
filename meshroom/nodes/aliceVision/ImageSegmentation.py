__version__ = "1.0"

from meshroom.core import desc


class ImageSegmentation(desc.AVCommandLineNode):
    commandLine = 'aliceVision_imageSegmentation {allParams}'
    size = desc.DynamicNodeSize('input')
    gpu = desc.Level.NORMAL
    parallelization = desc.Parallelization(blockSize=50)
    commandLineRange = '--rangeStart {rangeStart} --rangeSize {rangeBlockSize}'

    category = 'Utils'
    documentation = '''
Generate a mask with segmented labels for each pixel.
'''

    inputs = [
        desc.File(
            name="input",
            label="Input",
            description="SfMData file input.",
            value="",
            uid=[0],
        ),

        desc.File(
            name="modelPath",
            label="Segmentation Model",
            description="Weights file for the internal model.",
            value="${ALICEVISION_SEMANTIC_SEGMENTATION_MODEL}",
            uid=[0]
        ),

        desc.ListAttribute(
            elementDesc=desc.ChoiceParam(
                name="className",
                label="Class Name",
                description="Class name to be added to the mask.",
                value="person",
                values=[
                    "__background__",
                    "aeroplane",
                    "bicycle", "bird", "boat", "bottle", "bus",
                    "car", "cat", "chair", "cow",
                    "diningtable", "dog",
                    "horse",
                    "motorbike",
                    "person", "pottedplant",
                    "sheep", "sofa",
                    "train", "tvmonitor"
                ],
                exclusive=True,
                uid=[0]),
            name="validClasses",
            label="Classes",
            description="Classes names which are to be considered."
        ),

        desc.ChoiceParam(
            name="verboseLevel",
            label="Verbose Level",
            description="Verbosity level (fatal, error, warning, info, debug, trace).",
            value="info",
            values=["fatal", "error", "warning", "info", "debug", "trace"],
            exclusive=True,
            uid=[],
        )
    ]

    outputs = [
        desc.File(
            name="output",
            label="Masks Folder",
            description="Output path for the masks.",
            value=desc.Node.internalFolder,
            uid=[],
        ),
        desc.File(
            name="masks",
            label="Masks",
            description="Generated segmentation masks.",
            semantic="image",
            value=desc.Node.internalFolder + "<VIEW_ID>.exr",
            group="",
            uid=[],
        ),
    ]

