import { Action } from '@ngrx/store';

export enum WeatherCallActionTypes {
    WeatherCallLoaded = '[WeatherCalls] WeatherCall Loaded',
    WeatherCallFailed = '[WeatherCalls] WeatherCall Failed'
}

export class WeatherCallLoaded implements Action {
    readonly type = WeatherCallActionTypes.WeatherCallLoaded;
    constructor(public location: string, public weathercall: any) { }
}

export class WeatherCallFailed implements Action {
    readonly type = WeatherCallActionTypes.WeatherCallFailed;
    constructor(public location: string, public error: any) { }
}

export type WeatherCallActions = WeatherCallLoaded | WeatherCallFailed;