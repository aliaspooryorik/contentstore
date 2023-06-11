component implements="cbvalidation.interfaces.IValidator" singleton {

	/**
	 * Will check if an incoming value validates
	 *
	 * @validationResultThe result object of the validation
	 * @targetThe           target object to validate on
	 * @fieldThe            field on the target object to validate on
	 * @targetValueThe      target value to validate
	 */
	boolean function validate(
		required any validationResult,
		required any target,
		required string field,
		any targetValue,
		any validationData,
		struct rules
	){
		if ( targetValue == "" ) {
			// if you want it to be required use the required criteria
			return true;
		}
		if ( passesRules( targetValue, validationData ) ) {
			return true;
		}

		validationResult.addError(
			validationResult.newError(
				argumentCollection = {
					message        : "The #arguments.field# '#arguments.targetValue#' does not meet the rules. #failureMessage( validationData )#",
					field          : arguments.field,
					validationType : getName(),
					validationData : arguments.validationData
				}
			)
		);
		return false;
	}

	/**
	 * Get the name of the validator
	 */
	string function getName(){
		return "Password";
	}

	private boolean function passesRules( targetValue, validationData ){
		return hasValidLength( targetValue, validationData ) &&
		hasMinimumLowerCase( targetValue, validationData ) &&
		hasMinimumUpperCase( targetValue, validationData ) &&
		hasMinimumNumeric( targetValue, validationData ) &&
		hasMinimumSymbols( targetValue, validationData );
	}

	private boolean function hasValidLength( targetValue, validationData ){
		if ( !structKeyExists( validationData, "minsize" ) ) {
			return true;
		}
		return targetValue.len() >= validationData.minsize;
	}

	private boolean function hasMinimumLowerCase( targetValue, validationData ){
		if ( !structKeyExists( validationData, "minlowercase" ) ) {
			return true;
		}
		return reReplace( targetValue, "[^a-z]", "" ).len() >= validationData.minlowercase;
	}

	private boolean function hasMinimumUpperCase( targetValue, validationData ){
		if ( !structKeyExists( validationData, "minuppercase" ) ) {
			return true;
		}
		return reReplace( targetValue, "[^A-Z]", "" ).len() >= validationData.minuppercase;
	}

	private boolean function hasMinimumNumeric( targetValue, validationData ){
		if ( !structKeyExists( validationData, "minnumeric" ) ) {
			return true;
		}
		return reReplace( targetValue, "[^0-9]", "" ).len() >= validationData.minnumeric;
	}

	private boolean function hasMinimumSymbols( targetValue, validationData ){
		if ( !structKeyExists( validationData, "minsymbols" ) ) {
			return true;
		}
		return reReplaceNoCase( targetValue, "[^a-z0-9]", "" ).len() >= validationData.minnumeric;
	}

	private string function failureMessage( validationData ){
		var result = [];
		if ( structKeyExists( validationData, "minlowercase" ) ) {
			result.append( "At least #validationData.minlowercase# lowercase characters." );
		}
		if ( structKeyExists( validationData, "minuppercase" ) ) {
			result.append( "At least #validationData.minuppercase# uppercase characters." );
		}
		if ( structKeyExists( validationData, "minnumeric" ) ) {
			result.append( "At least #validationData.minnumeric# numeric characters." );
		}
		if ( structKeyExists( validationData, "minsymbols" ) ) {
			result.append( "At least #validationData.minsymbols# special characters." );
		}
		return result.toList( " " );
	}

}
