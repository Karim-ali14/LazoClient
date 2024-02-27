import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';
//Generate : flutter pub run build_runner build --delete-conflicting-outputs
@Openapi(
    additionalProperties:
    AdditionalProperties(pubName: 'athletix', pubAuthor: 'zimozi'),
    inputSpecFile: '../base_flutter_app/assets/cart-tech.yaml',
    generatorName: Generator.dart,
    alwaysRun: true,
    skipSpecValidation: true,
    outputDirectory: '../base_flutter_app/lib/Data/Network')
class Example extends OpenapiGeneratorConfig {}