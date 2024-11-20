import { NgModule } from '@angular/core';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { AppLayoutModule } from './Shared/layout/app.layout.module';
import { DashboardComponent } from './Admin/dashboard/dashboard.component';
import { HomeModule } from './Landing/home/home.module';
import { NotfoundComponent } from './Shared/Component/notfound/notfound.component';
import { AuthModule } from './auth/auth.module';

@NgModule({
    declarations: [
        AppComponent,
        DashboardComponent,
        DashboardComponent,
        NotfoundComponent
    ],
    imports: [
        AppRoutingModule,
        AppLayoutModule,
        HomeModule,
        AuthModule
    ],
    providers: [],
    bootstrap: [AppComponent]
})
export class AppModule { }
