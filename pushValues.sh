#!/bin/bash

git add * >> /dev/null 2>&1
git commit -m "update" >> /dev/null 2>&1
git push origin master >> /dev/null 2>&1
