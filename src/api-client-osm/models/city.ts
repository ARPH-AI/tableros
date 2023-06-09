/* tslint:disable */
/* eslint-disable */
/**
 * Nominatim
 * Interface for the search engine used on the OpenStreetMap website
 *
 * The version of the OpenAPI document: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */



/**
 * 
 * @export
 * @interface City
 */
export interface City {
    /**
     * 
     * @type {number}
     * @memberof City
     */
    'place_id'?: number;
    /**
     * 
     * @type {string}
     * @memberof City
     */
    'licence'?: string;
    /**
     * 
     * @type {string}
     * @memberof City
     */
    'osm_type'?: string;
    /**
     * 
     * @type {number}
     * @memberof City
     */
    'osm_id'?: number;
    /**
     * 
     * @type {Array<string>}
     * @memberof City
     */
    'bounding_box'?: Array<string>;
    /**
     * 
     * @type {string}
     * @memberof City
     */
    'lat'?: string;
    /**
     * 
     * @type {string}
     * @memberof City
     */
    'lon'?: string;
    /**
     * 
     * @type {string}
     * @memberof City
     */
    'display_name'?: string;
    /**
     * 
     * @type {number}
     * @memberof City
     */
    'place_rank'?: number;
    /**
     * 
     * @type {string}
     * @memberof City
     */
    'category'?: string;
    /**
     * 
     * @type {string}
     * @memberof City
     */
    'type'?: string;
    /**
     * 
     * @type {number}
     * @memberof City
     */
    'importance'?: number;
    /**
     * 
     * @type {string}
     * @memberof City
     */
    'icon'?: string;
}

