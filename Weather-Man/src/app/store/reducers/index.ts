import { ActionReducerMap, createSelector } from '@ngrx/store';

import { weathercallReducer, WeatherCallState } from "./weather-calls.reducer";
import { locationReducer, LocationState } from "./locations.reducer";



export interface State {
    locations: LocationState,
    weathercalls: WeatherCallState
}

export const reducers: ActionReducerMap<State> = {
    locations: locationReducer,
    weathercalls: weathercallReducer
}

export const selectLocationState = (state: State) => state.locations;
export const selectLocationList = createSelector(selectLocationState, (state: LocationState) => state.locations);

export const selectWeatherCallState = (state: State) => state.weathercalls;
export const selectWeatherCallList = createSelector(selectWeatherCallState, (state: WeatherCallState) => state.weathercalls);