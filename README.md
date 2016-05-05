# Meshblu Connectors

## TL;DR

Gateblu is complex, unstable, and an overall bad experience. We are removing it and moving towards running the devices in isolated applications. We are calling them Meshblu Connectors. They are cross-platform, signed, pre-compiled, and pre-configured.

## Introduction

We have gone through several iterations of Gateblu, trying to solve a very complex problem in complex ways. By nature Gateblu was complicated, hard to manage, and a bad user experience. We've taken the good parts of Gateblu, a long with some other ideas, to create something simple.

## Installation Overview

In [connector-factory.octoblu.com](https://connector-factory.octoblu.com) you'll be able to download an installer after creating a connector, or viewing an existing one. After selecting the version you want to download, a OTP (One Time Password) will setup, with the device's UUID, Token, and metadata about the installation. During the downloading step, will rename the installer with the OTP.

Each connector will run independently in an isolated environment. The connector will come in an installer that is pre-configured for your device. When you run the installer, it pulls down some core libraries that allow us to do cross-platform installation of the connector. Each of the new connectors will be pre-compiled and stored in Github Releases. During the installation the release will be pulled down and installed on your local file system. The final step sets up the service files, allowing the connector to run on boot.

After the installation of your device, or connector, it will be controlled through 'app.octoblu.com' or 'connector-factory.octoblu.com'. Where you'll be able to start, stop, and configure your device.
