import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UsersRoutingModule } from './users-routing.module';
import { UsersComponent } from './users.component';
import { UsersListComponent } from './users-list/users-list.component';
import { UserEditComponent } from './users-list/user-edit/user-edit.component';
import { UserCardComponent } from './users-list/user-card/user-card.component';

@NgModule({
  declarations: [
    UsersComponent,
    UsersListComponent,
    UserEditComponent,
    UserCardComponent
  ],
  imports: [
    CommonModule,
    UsersRoutingModule
  ]
})
export class UsersModule { }
