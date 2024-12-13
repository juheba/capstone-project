export class Error {

  errorCode: string;
  statusCode: number;
  type: string;
  message: string;
  details?: string;

/**
 * Constructs an instance of the Error class.
 *
 * @param {ErrorType} type - The type of the error, either TECHNICAL or BUSINESS.
 * @param {number} statusCode - The HTTP status code associated with the error.
 * @param {string} message - A descriptive message for the error.
 * @param {string} [customCode] - An optional custom code to further classify the error.
 * @param {string} [details] - Optional additional details about the error.
 */
  constructor(type: ErrorType, statusCode: number, message: string,
      customCode?: string, details?: string) {
    this.statusCode = statusCode;
    this.type = type.type;
    this.message = message;
    this.details = details;

    console.error(`Error: ${this.type} ${type} ${this.message}`);

    let errorCodeAbbreviation: ErrorCodeAbbreviation;
    // Create Errorcode
    if (customCode) {
      errorCodeAbbreviation = ErrorCodeAbbreviation.CUSTOM
    } else {
      errorCodeAbbreviation = ErrorCodeAbbreviation.STATUS
    }
    this.errorCode = `${type.abbrevation}${errorCodeAbbreviation}${statusCode}`
  }
}

class ErrorType {
  type: string;
  abbrevation: string;

  constructor(type: string, abbrevation: string) {
    this.type = type;
    this.abbrevation = abbrevation;
  }
}

export const ErrorTypes = {
  TECHNICAL: new ErrorType("TECHNICAL", "T"),
  BUSINESS: new ErrorType("BUSINESS", "B")
};

export enum ErrorCodeAbbreviation {
  STATUS = "S",
  CUSTOM = "C"
}


/**
 * Abstract base class that represents an error with a specific type, status code, message, and optional details.
 */
export abstract class AbstractError {

  type: ErrorType;
  error: Error;

  constructor(type: ErrorType, statusCode: number, message: string,
    customCode?: string, details?: string) {
      this.type = type;
      this.error = new Error(type, statusCode, message, customCode, details)
  }

  /**
   * Sets the details of the error. The details are used to provide
   * additional information about the error. The details are optional.
   *
   * @param {string} details The details of the error.
   * @returns {AbstractError} The same error instance.
   */
  setDetails(details: string): AbstractError {
    this.error.details = details;
    return this;
  }

  /**
   * Converts the error object to a JSON string representation.
   *
   * @returns {string} A JSON string representing the error.
   */
  toJSON() {
    return JSON.stringify(this.error)
  }

  /**
   * Converts the error object to a JSON response object
   * compatible with AWS Lambda.
   *
   * @returns {Object} A JSON response object with the error as body and the
   * corresponding status code.
   */
  asJSONResponse() {
    return {
      statusCode: this.error.statusCode,
      body: this.toJSON()
    }
  }
}

/**
 * Extends the AbstractError class to represent a technical error with the ErrorType.TECHNICAL type.
 */
export class TechnicalError extends AbstractError {

  /**
   * Constructs a TechnicalError with the given status code, message, custom code, and details.
   *
   * @param {number} statusCode The HTTP status code associated with the error.
   * @param {string} message A descriptive message for the error.
   * @param {string} [customCode] An optional custom code to further classify the error.
   * @param {string} [details] Optional additional details about the error.
   */
  constructor(statusCode: number, message: string, customCode?: string, details?: string) {
    super(ErrorTypes.TECHNICAL, statusCode, message, customCode, details);
  }

}

/**
 * Extends the AbstractError class to represent a business error with the ErrorType.BUSINESS type.
 */
export class BusinessError extends AbstractError {

  /**
   * Constructs a BusinessError with the given status code, message, custom code, and details.
   *
   * @param {number} statusCode The HTTP status code associated with the error.
   * @param {string} message A descriptive message for the error.
   * @param {string} [customCode] An optional custom code to further classify the error.
   * @param {string} [details] Optional additional details about the error.
   */
  constructor(statusCode: number, message: string, customCode?: string, details?: string) {
    super(ErrorTypes.BUSINESS, statusCode, message, customCode, details);
  }

}
