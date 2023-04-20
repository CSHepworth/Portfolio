import { WeatherCallActions, WeatherCallActionTypes } from "../actions/weather-calls.action";


export interface WeatherCallState {
    weathercalls: Map<string, any>;
}

export const initialState: WeatherCallState = {
    weathercalls: new Map()
};

export function weathercallReducer(state = initialState, action: WeatherCallActions): WeatherCallState {
    switch(action.type) {
        case WeatherCallActionTypes.WeatherCallLoaded:
            const c = new Map(state.weathercalls);
            c.set(action.location, action.weathercall);
            return {...state, weathercalls: c};
        default:
            return state;
    }
}