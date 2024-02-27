
import '../Utils/UtilsExts.dart';
import 'Extintions.dart';
class ValidationUtils {


  static String? Function(String?)? emailValidation(message,{String? otherFieldValue,String? customValidation}){
    return (val) {
      if(customValidation != null) return customValidation;
      if(val?.isEmpty == true && otherFieldValue?.isEmpty == true) return "";
      if(val?.isEmpty == true) return message;
      if(val?.isNotEmpty == true && (!validateEmail(val ?? ""))) return "Enter a valid email address";
      return null;
    };
  }


  static String? Function(String?)? required(message,{String? otherFieldValue}){
    return (val) => val?.isEmpty == true ? message : null;
  }

  static String? Function(String?)? passwordValid(message) {
    return (val) =>
    (val?.meetsPasswordRequirements() == true || val?.isEmpty == true)
        ? message
        : null;
  }

  static String? Function(String?)? customValidation(String? message){
    return (val) => message;
  }

  static String? Function(String?)? validation(message,{List<String>? otherFieldsValues,String? customValidation}){
    return (val) {
      if(customValidation != null) return customValidation;
      if(val?.isEmpty == true && otherFieldsValues?.any((element) => element.isEmpty) == true) return "";
      if(val?.isEmpty == true) return message;
      return null;
    };
  }

  static String? passwordMatch(nVal,otherPassword,message){
    if(nVal != otherPassword) return message;
    return null;
  }
}