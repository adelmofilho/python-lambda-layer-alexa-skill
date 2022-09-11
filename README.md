# Python Lambda layer for Alexa skills
[![Pipeline](https://github.com/triplebackslash/python-lambda-layer-alexa-skill/actions/workflows/pipeline.yml/badge.svg)](https://github.com/triplebackslash/python-lambda-layer-alexa-skill/actions/workflows/pipeline.yml)
![](https://shields.io/badge/python-3.7%20%7C%203.8%20%7C%203.9-blue)

## Overview

This project makes available multiple lambda layers with core Python packages needed to run Alexa skills.

### sa-east-1

| Python version | Arn                                                                      |
|----------------|--------------------------------------------------------------------------|
| python3.7      | arn:aws:lambda:sa-east-1:037635704544:layer:layer_alexa_skill_python37:1 |
| python3.8      | arn:aws:lambda:sa-east-1:037635704544:layer:layer_alexa_skill_python38:1 |
| python3.8      | arn:aws:lambda:sa-east-1:037635704544:layer:layer_alexa_skill_python39:1 |

### us-east-1

| Python version | Arn                                                                      |
|----------------|--------------------------------------------------------------------------|
| python3.7      | arn:aws:lambda:us-east-1:037635704544:layer:layer_alexa_skill_python37:1 |
| python3.8      | arn:aws:lambda:us-east-1:037635704544:layer:layer_alexa_skill_python38:1 |
| python3.8      | arn:aws:lambda:us-east-1:037635704544:layer:layer_alexa_skill_python39:1 |

## Background

While I was studying how to create alexa skills using custom lambda functions, I came across the fact that lambda functions don't have the `ask-sdk-core` package installed by default. As I didn't find public lambda layers with the `ask-sdk-core` package I decided to create and make them available.

## References

- [How do I create a Lambda layer using a simulated Lambda environment with Docker?](https://aws.amazon.com/pt/premiumsupport/knowledge-center/lambda-layer-simulated-docker/)

- [Setting Up the ASK SDK](https://www.developer.amazon.com/en-US/docs/alexa/alexa-skills-kit-sdk-for-python/set-up-the-sdk.html)