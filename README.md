# Pothole Detection V2V Simulink

A real-time Vehicle-to-Vehicle (V2V) road-hazard detection and warning
pipeline built with **MATLAB/Simulink** and a **14-DOF vehicle dynamics
model** (`PassVeh14DOF`). The system combines camera-based pothole
detection using **YOLOv8n** with inertial-sensor classification using a
**PyTorch-trained LSTM**. Detected hazards are mapped to road
coordinates and communicated to a trailing vehicle, which receives a
braking warning as it approaches a pothole.

> **Project status:** The performance figures and model behavior below
> describe the implementation as provided. Validate them on your own
> machine and test scenarios before treating them as safety-performance
> claims.

------------------------------------------------------------------------

## Demo

* 🎥 **[Watch the Simulation & Presentation Demo](https://docs.google.com/videos/d/1sv2MuD71VgZPa28rcBwbzS_lrQjvU-SFO_gzQ7201JM/play?usp=sharing)** — *Pothole Detection V2V Presentation*
* 🎬 **[Watch the Additional Recording](https://docs.google.com/videos/d/1sJYVIrc5QXkzek_H5uXw9ByvOElGyztRb0MTXm-hGQU/play?usp=sharing)** — *Demo Recording*


------------------------------------------------------------------------

## System architecture

The pipeline consists of five stages:

### 1. Camera-based detection --- `Vision_ML_Detector`

-   **Model:** Custom-trained YOLOv8n model exported to ONNX
    (`best.onnx`) and imported into MATLAB as `yolo_pothole_net.mat`.
-   **Output:** The model wrapper expects an output with shape
    `[8400 × 7]`.
-   **Inference:** `run_pothole_yolo.m` is called through
    `coder.extrinsic` at 20 Hz (every third frame of a 60 Hz video
    feed).
-   **Detection output:** The pothole-class confidence score is passed
    to the sensor-fusion subsystem.
-   **Reported test-set metrics (pothole class):**
    -   mAP@0.50: `0.642`
    -   Recall: `0.653`
    -   Precision: `0.570`

### 2. IMU vibration detection --- `ML_Pothole_Detector`

-   **Model:** PyTorch-trained LSTM exported to ONNX
    (`pothole_lstm.onnx`) and imported into MATLAB as `pothole_net.mat`.
-   **Input:** A 30-sample sliding window of three-axis chassis-CG
    acceleration: `[ax, ay, az]`, obtained from the 14-DOF vehicle
    plant.
-   **Inference:** `run_pothole_lstm.m` is called through
    `coder.extrinsic`.
-   **Preprocessing:** The wrapper applies mean-centering and
    suspension-damping gain compensation before inference.

### 3. Sensor fusion --- `Sensor_Fusion`

The subsystem combines the camera and IMU model outputs into a fused
pothole probability (`fused_prob`) in the range `0.0–1.0`.

A detection threshold of `0.65` is used to reject the reported
smooth-road baseline (approximately `0.40`) and register a hazard.

### 4. V2V hazard mapping and notification --- `V2V_Hazard_Notifier`

-   When `fused_prob > 0.65`, the lead vehicle's road coordinate
    (`Last_Mapped_X`) is recorded as a pothole location.
-   A minimum spacing of `20 m` is used to avoid repeatedly recording
    the same detected hazard.
-   The mapped coordinate is made available to the trailing vehicle,
    which travels at a nominal speed of `14 m/s`.
-   When the trailing vehicle enters the `10 m` warning zone before a
    mapped pothole, `V2V_Alert_Flag` is asserted (`0 → 1 → 0`) and the
    vehicle is commanded to decelerate toward `8 m/s`.

### 5. Monitoring --- `V2V_Scope`

The scope displays the sensor-fusion probability, V2V alert state, and
distance to the next mapped pothole. See [Interpreting the
scope](#interpreting-the-v2v_scope-outputs).

------------------------------------------------------------------------

## Repository structure

``` text
pothole-detection-v2v-simulink/
├── start_simulation.m                 # Configures paths and opens the model
├── inputs/
│   ├── simulink_ready_video.mp4       # Video prepared for vision inference
│   ├── sample_video.mp4               # Raw source video
│   └── modification.m                 # Video preprocessing script
├── models/
│   ├── best.onnx                      # YOLOv8n ONNX model
│   ├── yolo_pothole_net.mat            # Imported MATLAB YOLO network
│   ├── run_pothole_yolo.m              # YOLO inference wrapper
│   ├── pothole_lstm.onnx               # LSTM ONNX model
│   ├── pothole_net.mat                 # Imported MATLAB LSTM network
│   ├── run_pothole_lstm.m              # LSTM inference wrapper
│   ├── +best/                          # Generated YOLO custom layers
│   └── +pothole_lstm/                  # Generated LSTM custom layers
├── PassVeh14DOF/
│   ├── PotholeDetection3D.slx           # Main Simulink co-simulation model
│   ├── Plant/                          # Vehicle model and data dictionaries
│   └── *.m                             # Pipeline setup and routing scripts
└── VehicleConfig/
    └── Config/
        └── VehicleConfig.sldd          # Shared vehicle configuration dictionary
```

------------------------------------------------------------------------

## Prerequisites

-   MATLAB and Simulink (R2023b or newer recommended)
-   Deep Learning Toolbox
-   Deep Learning Toolbox Converter for ONNX Model Format
-   Vehicle Dynamics Blockset (for the `PassVeh14DOF` vehicle model)
-   Computer Vision Toolbox (for video input and computer-vision
    functionality)

The exact MATLAB release and toolbox versions required may depend on the
model files and ONNX import workflow used in this repository.

------------------------------------------------------------------------

## Quick start

1.  Clone the repository:

    ``` bash
    git clone https://github.com/horiznsky/pothole-detection-v2v-simulink.git
    ```

2.  Open MATLAB and set the current folder to the cloned repository
    root.

3.  Run the startup script in the MATLAB Command Window:

    ``` matlab
    start_simulation
    ```

4.  When `PotholeDetection3D.slx` opens, click **Run** in Simulink.

------------------------------------------------------------------------

## Interpreting the `V2V_Scope` outputs

| Plot | Signal | Meaning |
|---|---|---|
| Top | Sensor-fusion probability (0–1) | Combined YOLOv8n and LSTM pothole confidence. Values above 0.65 register a new hazard. |
| Middle | V2V alert flag (0/1) | Goes HIGH when the trailing vehicle enters the 10 m warning zone and returns LOW after the alert condition clears. |
| Bottom | Distance to next pothole (m) | Distance from the trailing vehicle to the nearest mapped hazard. 999 m indicates no mapped hazard ahead. |

## Notes and limitations

-   The inference wrappers use `coder.extrinsic`. This is suitable for
    MATLAB-based simulation workflows, but it does **not** by itself
    establish that the inference path is deployable as generated
    standalone code or suitable for hard real-time execution.
-   The stated 20 Hz vision inference rate assumes a 60 Hz input feed
    and processing every third frame.
-   The reported YOLO metrics are dataset-specific. Include the test-set
    size, split methodology, class definitions, and evaluation settings
    when presenting these results in a paper or technical report.
-   The braking behavior described here is a simulation feature, not a
    validated vehicle safety function. Do not use it to control a real
    vehicle.
-   Ensure that the video files, model files, generated custom-layer
    packages, Simulink model, and data dictionaries are present at the
    paths expected by the startup script.

------------------------------------------------------------------------

