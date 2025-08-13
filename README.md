[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 12](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 13](https://img.shields.io/badge/Pharo-13-%23aac9ff.svg)](https://pharo.org/download)

[![License](https://img.shields.io/github/license/OpenSmock/Toplo-Serialization.svg)](./LICENSE)
[![Unit tests](https://github.com/OpenSmock/Toplo-Serialization/actions/workflows/CI.yml/badge.svg)](https://github.com/OpenSmock/Toplo-Serialization/actions/workflows/CI.yml)

# Toplo-Serialization
Toplo serialization features to store/unstore ToElements.

## Getting Started

### Installation

To install the project on your Pharo image you can just execute the following script:

```smalltalk
Metacello new
   baseline: 'ToploSerialization';
   repository: 'github://OpenSmock/Toplo-Serialization:main/src';
   load.
```

## Dependencies

- [Toplo](https://github.com/plantec/Toplo)
- [Bloc-Serialization](https://github.dev/OpenSmock/Bloc-Serialization)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
