import { RouterModule, Routes } from '@angular/router';
import { NgModule } from '@angular/core';
import { AppLayoutComponent } from "./Shared/layout/app.layout.component";
import { DashboardComponent } from './Admin/dashboard/dashboard.component';
import { HomeComponent } from './Landing/home/home.component';
import { MatchesComponent } from './Admin/matches/matches.component';
import { NotfoundComponent } from './Shared/Component/notfound/notfound.component';

const routes: Routes = [
    { path: '', component:HomeComponent },    
    {
        path: 'Admin', component: AppLayoutComponent,
        children: [
            { path: '', component:DashboardComponent },
            { path: 'Users', loadChildren: () => import('./Admin/users/users.module').then(m => m.UsersModule)},   
            { path: 'Players', loadChildren: () => import('./Admin/players/players.module').then(m => m.PlayersModule)},             
            { path: 'Stades', loadChildren: () => import('./Admin/stades/stades.module').then(m => m.StadesModule)},        
            { path: 'Matches', loadChildren: () => import('./Admin/matches/matches.module').then(m => m.MatchesModule)},     
            { path: 'Matches', component:MatchesComponent },
        ]
    },
    { path: 'auth', loadChildren: () => import('./auth/auth.module').then(m => m.AuthModule) },
    { path: 'notfound', component: NotfoundComponent },
    { path: '**', redirectTo: '/notfound' },   
  ];
  
@NgModule({
    imports: [
        RouterModule.forRoot(routes, { scrollPositionRestoration: 'enabled', anchorScrolling: 'enabled', onSameUrlNavigation: 'reload' })
    ],
    exports: [RouterModule]
})
export class AppRoutingModule {
}
