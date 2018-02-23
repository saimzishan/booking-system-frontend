/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { UserNameService } from './user-name.service';
import {PreferedAllocationService} from './prefered-allocation.service';

describe('PreferedAllocationService', () => {
    let prefAllocationBackup = [];
    let selectedInterpreter = {};
    beforeEach(() => {
        TestBed.configureTestingModule({
            providers: [PreferedAllocationService]
        });
    });

    it('should exists', inject([PreferedAllocationService],
        (service: PreferedAllocationService) => {
        expect(service).toBeTruthy();
    }));
});
