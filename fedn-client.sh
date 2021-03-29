#!/bin/bash
nvidia-docker run -v /home/jetson/example:/app scaleoutsystems/agx:sklearn  fedn run client -in fedn-network.yaml
