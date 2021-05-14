#!/bin/bash
weather=$(curl -s wttr.in/perth?format=%t)
printf " %s %s \n" "$weather"
