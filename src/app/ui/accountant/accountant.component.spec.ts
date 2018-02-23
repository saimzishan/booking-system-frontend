import {async, ComponentFixture, TestBed} from '@angular/core/testing';

import {AccountantComponent} from './accountant.component';
import {FormsModule} from '@angular/forms';
import {CustomFormsModule} from 'ng2-validation';
import {AddressComponent} from '../address/address.component';
import {Accountant} from '../../shared/model/user.entity';
import {SimpleNotificationsModule} from 'angular2-notifications/src/simple-notifications.module';
import {NotificationServiceBus} from '../../notification/notification.service';
import {MockBackend} from '@angular/http/testing';
import {AuthHttp} from 'angular2-jwt';
import {GmapsApiService} from '../../api/gmaps-api.service';
import {FakeOpMapsAPILoader} from '../../shared/test/Mock';
import {MapsAPILoader} from '@agm/core';

describe('AccountantComponent', () => {
    let component: AccountantComponent;
    let fixture: ComponentFixture<AccountantComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [AccountantComponent, AddressComponent],
            providers: [NotificationServiceBus, GmapsApiService, {provide: AuthHttp, useClass: MockBackend}, { provide: MapsAPILoader, useClass: FakeOpMapsAPILoader}],
            imports: [FormsModule, CustomFormsModule, SimpleNotificationsModule]
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(AccountantComponent);
        component = fixture.componentInstance;
        component.userModel = new Accountant();
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
