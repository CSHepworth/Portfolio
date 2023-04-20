import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class WeatherCallsService {

  private weathercalls = [];

  constructor(private http: HttpClient) { }

  loadWeatherCall(location: string): Observable<any> {
    return this.http.get(
      `http://api.weatherapi.com/v1/current.json?key=44cec275959c4e4aa2a02110222211&q=${location}`
    );
  }

  removeWeatherCall(location: string) {
    for (let i in this.weathercalls) {
      if (this.weathercalls[i].loc == location)
        this.weathercalls.splice(+i, 1);
    }
  }

  getWeatherCalls(): any[] {
    return this.weathercalls;
  }
}
