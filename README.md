# Open-Elevation

[https://open-elevation.com](https://open-elevation.com)

A free and open-source elevation API.

**Open-Elevation** is a free and open-source alternative to the [Google Elevation API](https://developers.google.com/maps/documentation/elevation/start) and similar offerings.

This projects provides you with a simple and easy to use open-elevation service to be hosted yourself.

**API Docs are [available here](docs/api.md)**

You can learn more about the project, including its **free public API** in [the website](https://open-elevation.com)

## Quickstart

Use the provided makefile to build your docker image:

```bash
make build
```

Use the provided makefile to run the compose file:

```bash
make run
```

The application first downloads the srtm dataset and stores in a new data folder. This dataset is unarchived and prepared.
Afterwards a python server is started to serve the dataset.

## Attributation & changes

This project is forked from <https://github.com/Jorl17/open-elevation>. Make sure to check the open-elevation project
aswell and leave them a donation.

* Adjustments to dockerfile
* Added Makefile for docker image
* Small adjustments to docs and scripts
