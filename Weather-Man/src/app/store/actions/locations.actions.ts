import { Action } from '@ngrx/store';

export enum LocationActionTypes {
    AddLocation = '[Location] Add Location',
    RemoveLocation = '[Location] Remove Location'
}

export class AddLocation implements Action {

    readonly type = LocationActionTypes.AddLocation;
    
    constructor(public location: string) { }
}

export class RemoveLocation implements Action {

    readonly type = LocationActionTypes.RemoveLocation;

    constructor(public location: string) { }
}

export type LocationActions = AddLocation | RemoveLocation;