import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { StadesComponent } from './stades.component';

const routes: Routes = [
  { path: '', component:StadesComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class StadesRoutingModule { }
