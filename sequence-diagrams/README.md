# Sequence Diagrams

The sequence diagrams are generated using PlantUML.

## Install PlantUML

For more information about downloading and installing PlantUML, see PlantUML's website: [http://plantuml.com/download](http://plantuml.com/download)

### Via HomeBrew

PlantUML can be installed with HomeBrew:

```bash
brew install plantuml
```

## Generate the Diagrams

A bash script is included that will generate PNG files from the TXT PlantUML markup files. To generate the diagrams, run:

```bash
sequence-diagrams/generate.sh
```

### Via Watchman

If you have the Watchman file watching service installed, you can generate the diagrams in the background. To generate the diagrams via Watchman, run:

```bash
sequence-diagrams/watch.sh
```
