import { v4 as uuidv4 } from 'uuid';
import { Location, LocationsWithLastKey } from '@models/location'
import { LocationAccess } from '@dataLayer/locationAccess'
import { CreateLocationRequest, UpdateLocationRequest } from '@requests/location'
import { GetLimitNextKeyRequest } from '@requests/generel'

const locationAccess = new LocationAccess()

export async function getLocationsForUser(userId: string, getLimitNextKeyRequest: GetLimitNextKeyRequest): Promise<LocationsWithLastKey> {
  return await locationAccess.getLocationsForUser(userId, getLimitNextKeyRequest.limit, getLimitNextKeyRequest.nextKey)
}

export async function createLocation(userId: string, createLocationRequest: CreateLocationRequest,): Promise <Location> {
  const locationId = uuidv4()
  const currentDate = new Date().toISOString()
  const location: Location = {
    userId,
    locationId,
    name: createLocationRequest.name,
    description: createLocationRequest.description,
    image: createLocationRequest.image,
    notes: createLocationRequest.notes,
    addedAt: currentDate,
    lastModified: currentDate
  }
  return await locationAccess.createLocation(userId, location)
}

export async function updateLocation(userId: string, locationId: string, updateLocationRequest: UpdateLocationRequest): Promise <Location> {
  const location = {
    locationId,
    name: updateLocationRequest.name,
    description: updateLocationRequest.description,
    image: updateLocationRequest.image,
    notes: updateLocationRequest.notes,
    lastModified: new Date().toISOString()
  }
  return await locationAccess.updateLocation(userId, location)
}

export async function deleteLocation(userId: string, locationId: string): Promise<Boolean> {
  return await locationAccess.deleteLocation(userId, locationId)
}

/**
 * Validates if a location exists.
 *
 * @param userId  Id of a user
 * @param locationId  Id of a location
 * @returns  true if location exists, false otherwise
 */
export async function validateLocationExists(userId: string, locationId: string): Promise<Boolean> {
  return await locationAccess.validateLocationExists(userId, locationId)
}
