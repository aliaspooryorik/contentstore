component implements="cbvalidation.interfaces.IValidator" singleton {

	/**
	 * Will check if an incoming value validates
	 *
	 * @validationResult The result object of the validation
	 * @target           The target object to validate on
	 * @field            The field on the target object to validate on
	 * @targetValue      The target value to validate
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
					message : "The #arguments.field# '#arguments.targetValue#' does not meet the rules. #failureMessage( validationData )#",
					field : arguments.field,
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
		return "PasswordRules";
	}

	private boolean function passesRules( targetValue, validationData ){
		return hasValidLength( targetValue, validationData.minsize ) &&
		hasMinimumLowerCase( targetValue, validationData.minlowercase ) &&
		hasMinimumUpperCase( targetValue, validationData.minuppercase ) &&
		hasMinimumNumeric( targetValue, validationData.minnumeric ) &&
		hasMinimumSymbols( targetValue, validationData.minsymbols );
	}

	private boolean function hasValidLength( required string targetValue, required numeric minOccurances ){
		return targetValue.len() >= minOccurances;
	}

	private boolean function hasMinimumLowerCase( required string targetValue, required numeric minOccurances ){
		return reMatch( "[a-z]", targetValue ).len() >= minOccurances;
	}

	private boolean function hasMinimumUpperCase( required string targetValue, required numeric minOccurances ){
		return reMatch( "[A-Z]", targetValue ).len() >= minOccurances;
	}

	private boolean function hasMinimumNumeric( required string targetValue, required numeric minOccurances ){
		return reMatch( "[0-9]", targetValue ).len() >= minOccurances;
	}

	private boolean function hasMinimumSymbols( required string targetValue, required numeric minOccurances ){
		return reMatchNoCase( "[^a-z0-9]", targetValue ).len() >= minOccurances;
	}

	private string function failureMessage( validationData ){
		var result = [];
		if ( validationData.minsize > 0 ) {
			result.append( "At least #validationData.minsize# characters." );
		}
		if ( validationData.minlowercase > 0 ) {
			result.append( "At least #validationData.minlowercase# lowercase characters." );
		}
		if ( validationData.minuppercase > 0 ) {
			result.append( "At least #validationData.minuppercase# uppercase characters." );
		}
		if ( validationData.minnumeric > 0 ) {
			result.append( "At least #validationData.minnumeric# numeric characters." );
		}
		if ( validationData.minsymbols > 0 ) {
			result.append( "At least #validationData.minsymbols# special characters." );
		}
		return result.toList( " " );
	}

}
