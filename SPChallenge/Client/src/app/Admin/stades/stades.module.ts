import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StadesRoutingModule } from './stades-routing.module';
import { StadesComponent } from './stades.component';


@NgModule({
  declarations: [
    StadesComponent
  ],
  imports: [
    CommonModule,
    StadesRoutingModule
  ]
})
export class StadesModule { }
