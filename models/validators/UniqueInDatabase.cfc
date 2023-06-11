component implements="cbvalidation.interfaces.IValidator" singleton {

	property name="wirebox" inject="wirebox";

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
		var qb = wirebox
			.getInstance( arguments.validationData.entity )
			.where( arguments.validationData.field, arguments.targetValue );
		if ( !isNull( target.getId() ) ) {
			qb.where( "id", "<>", target.getId() );
		}

		if ( qb.get().len() == 0 ) {
			return true;
		}

		validationResult.addError(
			validationResult.newError(
				argumentCollection = {
					message        : "The #arguments.validationData.field# '#arguments.targetValue#' is already in use",
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
		return "UniqueInDatabase";
	}

}
