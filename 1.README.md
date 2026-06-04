

# Radar System Using Ultrasonic-Sensor

## Project Overview

This project presents an **Arduino Uno-based Radar Object Detection System** using an **HC-SR04 Ultrasonic Sensor**, **Servo Motor**, and **Processing Software**. The system performs real-time object detection by scanning a predefined area and displaying detected objects on a radar-like graphical interface.

This is a **hardware and software integrated academic project**, developed to demonstrate concepts of **embedded systems, sensor interfacing, data acquisition, and real-time visualization**.

---

## Motivation

Radar systems play a vital role in defense, aerospace, robotics, autonomous navigation, and surveillance applications. Due to the high cost and complexity of conventional radar systems, this project demonstrates a low-cost radar prototype using ultrasonic sensing technology for educational and experimental purposes.

---

## System Description

The radar system operates through the following steps:

1. The servo motor rotates the ultrasonic sensor from 0° to 180°.
2. The ultrasonic sensor continuously transmits ultrasonic waves.
3. Reflected waves from nearby objects are received by the sensor.
4. Distance to the object is calculated using the time-of-flight principle.
5. Arduino Uno processes the sensor data.
6. Data is transmitted to Processing Software through serial communication.
7. Processing Software displays detected objects on a radar-style graphical interface.

---

## Working Principle

### Distance Measurement

The HC-SR04 sensor measures distance using ultrasonic pulses.

Distance is calculated using:

Distance=\frac{Speed\ of\ Sound\times Time}{2}

Where:

* Speed of Sound ≈ 343 m/s
* Time = Echo pulse duration

The division by 2 accounts for the round-trip travel of the ultrasonic wave.

---

## Hardware Components

* Arduino Uno
* HC-SR04 Ultrasonic Sensor
* Servo Motor (SG90)
* Jumper Wires
* Breadboard
* USB Interface

---

## Software Used

* Arduino IDE
* Processing IDE
* Embedded C Programming

---

## System Features

* Real-time object detection
* Distance measurement and monitoring
* 180° scanning capability
* Radar-style graphical visualization
* Serial communication between hardware and software
* Low-cost implementation
* Easy integration with embedded systems

---

## Implementation

### Arduino Module

* Controls servo motor movement.
* Reads distance values from the ultrasonic sensor.
* Sends angle and distance data through serial communication.

### Processing Module

* Receives sensor data from Arduino.
* Generates radar-style graphical display.
* Displays object location based on angle and distance.

---

## Results

The developed system successfully:

* Detects objects within the sensing range.
* Measures object distance accurately.
* Displays object position in real time.
* Performs continuous area scanning.
* Demonstrates basic radar functionality using ultrasonic sensing technology.

---

## Applications

* Obstacle Detection Systems
* Robotics and Automation
* Smart Navigation Systems
* Surveillance Systems
* Educational Demonstrations
* Autonomous Vehicles
* Defense and Aerospace Fundamentals

---

## Future Enhancements

* Integration with IoT platforms
* Wireless data transmission
* Longer-range sensors
* AI-based object classification
* Real-time object tracking
* Mobile application integration

---

## Skills Demonstrated

* Embedded Systems
* Arduino Programming
* Sensor Interfacing
* Signal Processing Fundamentals
* Serial Communication
* Data Visualization
* Hardware Integration
* Problem Solving

---

## Author

**Dasari Vikramadithya**
B.Tech – Electronics and Communication Engineering
PALLAVI ENGINEERING COLLEGE, JNTUH

---

## Project Contents

* Arduino Source Code (.ino)
* Processing Source Code (.pde)
* Circuit Diagram
* Project Report
* Hardware Images
* Output Screenshots

⭐ If you find this project useful, feel free to star the repository!
