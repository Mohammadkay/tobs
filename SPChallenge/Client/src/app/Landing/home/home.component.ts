import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { LayoutService } from 'src/app/Shared/layout/service/app.layout.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent {
  constructor(public layoutService: LayoutService, public router: Router) { }
}
