import { TechnicalError, BusinessError } from "./Error";

// Technical
export const BadRequestParameterError: TechnicalError = new TechnicalError(400, 'Bad request parameter');
export const InternalServerError: TechnicalError = new TechnicalError(500, 'Internal Server error');

// Business
export const ResourceNotFoundError: BusinessError = new BusinessError(404, 'Resource not found');