/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';
import {UserService} from '../api/user.service';
import { Observable } from 'rxjs/Observable';
import { FormsModule }   from '@angular/forms';
import { CustomFormsModule } from 'ng2-validation';
import { EnumValPipe } from '../shared/pipe/enum-val.pipe';
import { HttpModule, BaseRequestOptions } from '@angular/http';
import {authService} from '../shared/global';
import {  Http, RequestOptions } from '@angular/http';
import { AuthHttp, AuthConfig } from 'angular2-jwt';
import { UserManagementComponent } from './user-management.component';
import { NotificationComponent } from '../notification/notification.component';
import {User} from '../shared/model/user.entity';
import {ROLE} from '../shared/model/role.enum';
import { UserHeaderComponent } from './user-header/user-header.component';
import {UserFilterComponent} from './user-filter/user-filter.component';
import {UserListComponent} from './user-list/user-list.component';
import { MockBackend, MockConnection } from '@angular/http/testing';
import {DummyComponent, MockUserService} from '../shared/test/Mock';
import { RouterTestingModule } from '@angular/router/testing';
import 'foundation-sites';
import {SpinnerService} from '../spinner/spinner.service';
import { NotificationServiceBus } from '../notification/notification.service';
import {RolePermission} from '../shared/role-permission/role-permission';

describe('UserManagement', () => {
    let component: UserManagementComponent;
    let fixture: ComponentFixture<UserManagementComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [UserManagementComponent],
            imports: [FormsModule, RouterTestingModule, CustomFormsModule, HttpModule],
            providers: [NotificationServiceBus, RolePermission,
            { provide: UserService, useClass: MockUserService }, SpinnerService, { provide: AuthHttp, useClass: MockBackend }]
        });
    }));

    beforeEach((done) => {
        fixture = TestBed.overrideComponent(UserManagementComponent, {
            set: {
                template: ''
            }
        })
            .createComponent(UserManagementComponent);
            TestBed.compileComponents();
        component = fixture.componentInstance;
        fixture.detectChanges();
        done();
    });

    it('should create', (done) => {
        expect(component).toBeTruthy();
        done();
    });

});
