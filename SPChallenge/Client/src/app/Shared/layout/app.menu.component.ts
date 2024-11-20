import { OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { LayoutService } from './service/app.layout.service';

@Component({
    selector: 'app-menu',
    templateUrl: './app.menu.component.html'
})
export class AppMenuComponent implements OnInit {

    model: any[] = [];

    constructor(public layoutService: LayoutService) { }

    ngOnInit() {
        this.model = [
            {
                label: 'Home',
                items: [
                    { label: 'Dashboard', icon: 'pi pi-fw pi-chart-pie', routerLink: ['/Admin'] }
                ]
            },
            {
                label: 'Admin',
                items: [
                    { label: 'Users', icon: 'pi pi-fw pi-user', routerLink: ['Users'] },
                    { label: 'Players', icon: 'pi pi-fw pi-users', routerLink: ['Players'] },                    
                    { label: 'Matches', icon: 'pi pi-fw pi-sitemap', routerLink: ['Matches'] },
                    { label: 'Stades', icon: 'pi pi-fw pi-map', routerLink: ['Stades'] },
                ]
            }            
        ];
    }
}
