/* tslint:disable */
/* eslint-disable */
/**
 * Backend API
 * Servidor Express
 *
 * The version of the OpenAPI document: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


import globalAxios, { AxiosPromise, AxiosInstance, AxiosRequestConfig } from 'axios';
import { Configuration } from '../configuration';
// Some imports not used depending on template conditions
// @ts-ignore
import { DUMMY_BASE_URL, assertParamExists, setApiKeyToObject, setBasicAuthToObject, setBearerAuthToObject, setOAuthToObject, setSearchParams, serializeDataIfNeeded, toPathString, createRequestFunction } from '../common';
// @ts-ignore
import { BASE_PATH, COLLECTION_FORMATS, RequestArgs, BaseAPI, RequiredError } from '../base';
// @ts-ignore
import { InlineResponse200 } from '../models';
// @ts-ignore
import { InlineResponse2001 } from '../models';
// @ts-ignore
import { InlineResponse2002 } from '../models';
// @ts-ignore
import { InlineResponse2003 } from '../models';
// @ts-ignore
import { InlineResponse2004 } from '../models';
// @ts-ignore
import { InlineResponse2005 } from '../models';
// @ts-ignore
import { InlineResponse400 } from '../models';
// @ts-ignore
import { LoginUser } from '../models';
// @ts-ignore
import { RefreshToken } from '../models';
/**
 * BackendApi - axios parameter creator
 * @export
 */
export const BackendApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        getHsiAccountInfo: async (options: AxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/hsi/account/info`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        getHsiAccountPermissions: async (options: AxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/hsi/account/permissions`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        getHsiPublicInfo: async (options: AxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/hsi/public/info`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        getHsiPublicVersion: async (options: AxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/hsi/public/version`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        getPublicVersion: async (options: AxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/public/version`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * 
         * @param {LoginUser} [loginUser] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        loginUser: async (loginUser?: LoginUser, options: AxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/auth`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(loginUser, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * 
         * @param {RefreshToken} [refreshToken] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        refreshToken: async (refreshToken?: RefreshToken, options: AxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/auth/refresh`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(refreshToken, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * BackendApi - functional programming interface
 * @export
 */
export const BackendApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = BackendApiAxiosParamCreator(configuration)
    return {
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async getHsiAccountInfo(options?: AxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<InlineResponse2003>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.getHsiAccountInfo(options);
            return createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration);
        },
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async getHsiAccountPermissions(options?: AxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<InlineResponse2002>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.getHsiAccountPermissions(options);
            return createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration);
        },
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async getHsiPublicInfo(options?: AxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<InlineResponse2005>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.getHsiPublicInfo(options);
            return createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration);
        },
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async getHsiPublicVersion(options?: AxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<InlineResponse2004>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.getHsiPublicVersion(options);
            return createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration);
        },
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async getPublicVersion(options?: AxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<InlineResponse2004>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.getPublicVersion(options);
            return createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration);
        },
        /**
         * 
         * @param {LoginUser} [loginUser] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async loginUser(loginUser?: LoginUser, options?: AxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<InlineResponse200>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.loginUser(loginUser, options);
            return createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration);
        },
        /**
         * 
         * @param {RefreshToken} [refreshToken] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async refreshToken(refreshToken?: RefreshToken, options?: AxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<InlineResponse2001>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.refreshToken(refreshToken, options);
            return createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration);
        },
    }
};

/**
 * BackendApi - factory interface
 * @export
 */
export const BackendApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = BackendApiFp(configuration)
    return {
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        getHsiAccountInfo(options?: any): AxiosPromise<InlineResponse2003> {
            return localVarFp.getHsiAccountInfo(options).then((request) => request(axios, basePath));
        },
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        getHsiAccountPermissions(options?: any): AxiosPromise<InlineResponse2002> {
            return localVarFp.getHsiAccountPermissions(options).then((request) => request(axios, basePath));
        },
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        getHsiPublicInfo(options?: any): AxiosPromise<InlineResponse2005> {
            return localVarFp.getHsiPublicInfo(options).then((request) => request(axios, basePath));
        },
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        getHsiPublicVersion(options?: any): AxiosPromise<InlineResponse2004> {
            return localVarFp.getHsiPublicVersion(options).then((request) => request(axios, basePath));
        },
        /**
         * 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        getPublicVersion(options?: any): AxiosPromise<InlineResponse2004> {
            return localVarFp.getPublicVersion(options).then((request) => request(axios, basePath));
        },
        /**
         * 
         * @param {LoginUser} [loginUser] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        loginUser(loginUser?: LoginUser, options?: any): AxiosPromise<InlineResponse200> {
            return localVarFp.loginUser(loginUser, options).then((request) => request(axios, basePath));
        },
        /**
         * 
         * @param {RefreshToken} [refreshToken] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        refreshToken(refreshToken?: RefreshToken, options?: any): AxiosPromise<InlineResponse2001> {
            return localVarFp.refreshToken(refreshToken, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * Request parameters for loginUser operation in BackendApi.
 * @export
 * @interface BackendApiLoginUserRequest
 */
export interface BackendApiLoginUserRequest {
    /**
     * 
     * @type {LoginUser}
     * @memberof BackendApiLoginUser
     */
    readonly loginUser?: LoginUser
}

/**
 * Request parameters for refreshToken operation in BackendApi.
 * @export
 * @interface BackendApiRefreshTokenRequest
 */
export interface BackendApiRefreshTokenRequest {
    /**
     * 
     * @type {RefreshToken}
     * @memberof BackendApiRefreshToken
     */
    readonly refreshToken?: RefreshToken
}

/**
 * BackendApi - object-oriented interface
 * @export
 * @class BackendApi
 * @extends {BaseAPI}
 */
export class BackendApi extends BaseAPI {
    /**
     * 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof BackendApi
     */
    public getHsiAccountInfo(options?: AxiosRequestConfig) {
        return BackendApiFp(this.configuration).getHsiAccountInfo(options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof BackendApi
     */
    public getHsiAccountPermissions(options?: AxiosRequestConfig) {
        return BackendApiFp(this.configuration).getHsiAccountPermissions(options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof BackendApi
     */
    public getHsiPublicInfo(options?: AxiosRequestConfig) {
        return BackendApiFp(this.configuration).getHsiPublicInfo(options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof BackendApi
     */
    public getHsiPublicVersion(options?: AxiosRequestConfig) {
        return BackendApiFp(this.configuration).getHsiPublicVersion(options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof BackendApi
     */
    public getPublicVersion(options?: AxiosRequestConfig) {
        return BackendApiFp(this.configuration).getPublicVersion(options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * 
     * @param {BackendApiLoginUserRequest} requestParameters Request parameters.
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof BackendApi
     */
    public loginUser(requestParameters: BackendApiLoginUserRequest = {}, options?: AxiosRequestConfig) {
        return BackendApiFp(this.configuration).loginUser(requestParameters.loginUser, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * 
     * @param {BackendApiRefreshTokenRequest} requestParameters Request parameters.
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof BackendApi
     */
    public refreshToken(requestParameters: BackendApiRefreshTokenRequest = {}, options?: AxiosRequestConfig) {
        return BackendApiFp(this.configuration).refreshToken(requestParameters.refreshToken, options).then((request) => request(this.axios, this.basePath));
    }
}
