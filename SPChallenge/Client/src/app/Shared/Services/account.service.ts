import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Login } from '../Models/Login';
import { BehaviorSubject, map } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AccountService {
  baseUrl = environment.apiUrl;
  // this object life time our browser once we close browser and open new one it will create new object
  private currentUserSource = new BehaviorSubject<User | null>(null);
  currentUser$ = this.currentUserSource.asObservable();

  constructor(private http: HttpClient) { }

  login(model: Login) {
    return this.http.post<User>(this.baseUrl + '/login', model).pipe(
      map((reponse: User) => {
        const user = reponse;

        if (user) {
          // this will keep our data saved even if you cloesed he browser / life time depened on browser settings days,hours,....   =
          localStorage.setItem('user', JSON.stringify(user));
          this.setCurrebtUser(user);
        }

        // you must return the object in case you want to print response or use it in othe TS files that calling this methode other wise it will retrun undefined
        return user;
      })
    )
  }

  register(model: any) {
    return this.http.post<User>(this.baseUrl + 'account/register', model).pipe(
      map(user => {
        if (user) {
          localStorage.setItem('user', JSON.stringify(user));
          this.setCurrebtUser(user);
        }
       // We didn't return response becuse we don't use it in other TS files that calling this methode the value will be undefined
      })
    )
  };

  setCurrebtUser(user: User | null) {
    this.currentUserSource.next(user);
  }

  logout() {
    localStorage.removeItem('user');
    this.setCurrebtUser(null);
  }
}