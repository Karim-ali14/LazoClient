import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';
//Generate : flutter pub run build_runner build --delete-conflicting-outputs
//Lines : https://lazo.sa/backend/public/final.yaml
@Openapi(
    additionalProperties:
    AdditionalProperties(pubName: 'lazo', pubAuthor: 'pomac'),
    inputSpecFile: '../LazoClient/assets/lazo.yaml',
    generatorName: Generator.dart,
    alwaysRun: true,
    skipSpecValidation: true,
    outputDirectory: '../LazoClient/lib/Data/Network/')
class Example extends OpenapiGeneratorConfig {}