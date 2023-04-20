import { LocationActions, LocationActionTypes } from "../actions/locations.actions";


export interface LocationState {
    locations: Array<string>;
}

export const initialState: LocationState = {
    locations: []
};

export function locationReducer(state = initialState, action: LocationActions): LocationState {
    switch(action.type) {
        case LocationActionTypes.AddLocation:
            return {...state, locations: [...state.locations, action.location]};
        case LocationActionTypes.RemoveLocation:
            return {...state, locations: state.locations.filter(i => i !== action.location)};
        default:
            return state;
    }
}