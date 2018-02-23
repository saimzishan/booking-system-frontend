/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';
import { SpacerPipe } from '../../shared/pipe/spacer.pipe';
import {LinkHelper, LinkAuth} from '../../shared/router/linkhelper';
import {RolePermission} from '../../shared/role-permission/role-permission';
import {HttpModule} from '@angular/http';
import { UserListComponent } from './user-list.component';
import {FormsModule} from '@angular/forms';
import {CustomFormsModule} from 'ng2-validation';
import {RouterTestingModule} from '@angular/router/testing';
import {NgxPaginationModule, PaginatePipe} from 'ngx-pagination';

describe('UserListComponent', () => {
  let component: UserListComponent;
  let fixture: ComponentFixture<UserListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UserListComponent, SpacerPipe ],
      providers: [RolePermission, LinkAuth],
      imports: [HttpModule, RouterTestingModule, NgxPaginationModule, FormsModule, CustomFormsModule]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UserListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
