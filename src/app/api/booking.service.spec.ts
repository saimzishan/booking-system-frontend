/* tslint:disable:no-unused-variable */

import {TestBed, async, inject} from '@angular/core/testing';
import {BookingService} from './booking.service';
import {GLOBAL} from '../shared/global';
import {Booking} from '../shared/model/booking.entity';
import {ROLE} from '../shared/model/role.enum';
import {
    ResponseOptions,
    Response,
    Http, HttpModule,
    BaseRequestOptions,
    RequestMethod
} from '@angular/http';
import {} from 'jasmine';
import {authService} from '../shared/global';
import {RequestOptions} from '@angular/http';
import {AuthHttp, AuthConfig} from 'angular2-jwt';

declare function require(name: string);

let Pact = require('pact-consumer-js-dsl');

let mock_response: Object[] = [
    new Object({
        id: 1,
        state: 'Requested'
    })
];

let mock_response_with_interpreters: Object[] = [
    new Object({
        state: 'Requested',
        'interpreters_attributes': [],
        'id': '2', 'venue': 'Fed Square',
        'requested_by_first_name': 'Georgious', 'nature_of_appointment': 'Translation',
        'specific_nature_of_appointment': 'Engagement', 'contact_first_name': 'Hadrian',
        'contact_last_name': 'French', 'contact_phone_number': '03 2342 2343',
        'contact_mobile_number': '0411 222 333', 'deaf_persons_first_name': 'Clifford', 'deaf_persons_mobile': '0444 555 666',
        'deaf_persons_email': 'clifford@vicdeaf.org.au', 'deaf_persons_eaf_no': '1231 0900', 'number_of_interpreters_required': '2',
        'number_of_people_attending': '1', 'start_time': '2017-04-02T07:50:19.212+00:00', 'end_time': '2017-04-02T08:50:19.212+00:00',
        'created_by': {'id': '12', 'email': 'something@creator.com', 'name': 'Fake Name',
        'type': 'OrganisationalRepresentative', 'organisation': 'Melb Uni'},
        'parking_availability': 'None',
        'address_attributes': {
            'unit_number': '12', 'street_number': '50',
            'street_name': 'Flemington Rd', 'suburb': 'Parkville', 'state': 'Victoria', 'post_code': '3025'
        }

    })
];

let mock_request_with_interpreters = new Object({
    'interpreters_attributes': [], 'id': '2', 'venue': 'Fed Square',
    'requested_by_first_name': 'Georgious', 'nature_of_appointment': 'Translation',
    'specific_nature_of_appointment': 'Engagement', 'contact_first_name': 'Hadrian',
    'contact_last_name': 'French', 'contact_phone_number': '03 2342 2343',
    'contact_mobile_number': '0411 222 333', 'deaf_persons_first_name': 'Clifford', 'deaf_persons_mobile': '0444 555 666',
    'deaf_persons_email': 'clifford@vicdeaf.org.au', 'deaf_persons_eaf_no': '1231 0900', 'number_of_interpreters_required': '2',
    'number_of_people_attending': '1', 'start_time': '2017-04-02T07:50:19.212+00:00', 'end_time': '2017-04-02T08:50:19.212+00:00',
    'created_by': {'id': '12', 'email': 'something@creator.com', 'name': 'Fake Name',
    'type': 'OrganisationalRepresentative', 'organisation': 'Melb Uni'},
    'parking_availability': 'None', 'address_attributes': {
        'unit_number': '12', 'street_number': '50',
        'street_name': 'Flemington Rd', 'suburb': 'Parkville', 'state': 'Victoria', 'post_code': '3025'
    }
});

describe('BookingService', () => {
    let bookingProvider;
    let mock_booking = new Booking();
    mock_booking.fromJSON(mock_request_with_interpreters);
    let mock_db: Booking[] = [mock_booking];
    beforeEach((done) => {
        TestBed.configureTestingModule({
            providers: [BookingService, {
                provide: AuthHttp,
                useFactory: authService,
                deps: [Http, RequestOptions]
            }],
            imports: [HttpModule]
        });

        bookingProvider = Pact.mockService({
            consumer: 'Booking-Specs',
            provider: 'Booking-Api',
            port: GLOBAL.MOCK_BOOKING_SERVER_PORT,
            done: done
        });
        done();
    });


    afterAll(function (done) {
        done();
    });

    it('should have valid http', inject([BookingService], (service) => {
        expect(service.isValidHttp()).toEqual(true);
    }));

    it('should exists', function (done) {
        inject([BookingService], (service: BookingService) => {
            expect(service).toBeTruthy();
            done();
        })();
    });

    it('interpreters should accept invite', done => {
        inject([BookingService], (service: BookingService) => {
            bookingProvider
                .given('booking exists in database')
                .uponReceiving('a request to invite interpreters')
                .withRequest('PUT', '/api/v1/bookings/2/interpreter/2/accept', {
                    'Accept': 'application/json, text/plain, */*',
                    'Content-Type': 'application/json'

                }).willRespondWith(204);

            bookingProvider.run(done, function (runComplete) {
                service.interpreterAction(2, 2, 'accept')
                    .subscribe((res: any) => {
                        expect(res.status).toEqual(204);
                        done();
                    }, err => done.fail(err), () => {
                        runComplete();
                    });
            });
        })();
    });

    it('interpreters should reject invite', done => {
        inject([BookingService], (service: BookingService) => {
            bookingProvider
                .given('booking does exists in database')
                .uponReceiving('a request to invite interpreters')
                .withRequest('PUT', '/api/v1/bookings/2/interpreter/2/reject', {
                    'Accept': 'application/json, text/plain, */*',
                    'Content-Type': 'application/json'

                }).willRespondWith(204);

            bookingProvider.run(done, function (runComplete) {
                service.interpreterAction(2, 2, 'reject')
                    .subscribe((res: any) => {
                        expect(res.status).toEqual(204);
                        done();
                    }, err => done.fail(err), () => {
                        runComplete();
                    });
            });
        })();
    });

    it('should create a Booking', function (done) {
        inject([BookingService], (service: BookingService) => {

            bookingProvider
                .given('booking does not exists in database')
                .uponReceiving('a request to create Booking')
                .withRequest('POST', '/api/v1/bookings', {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'

                }, {'booking': Pact.Match.somethingLike(mock_booking.clean(mock_booking.toJSON()))})

                .willRespondWith(201, {
                    'Content-Type': 'application/json; charset=utf-8'
                }, Pact.Match.somethingLike(mock_response[0]));

            bookingProvider.run(done, function (runComplete) {

                service.createBooking(mock_booking)
                    .subscribe((res: any) => {
                        service.bookings.push(res.data);
                        expect(res.status).toEqual(201);
                        done();
                    }, err => done.fail(err), () => {
                        runComplete();
                    });
            });
        })();
    });

    it('should bulk upload Bookings', function (done) {
        inject([BookingService], (service: BookingService) => {

            bookingProvider
                .given('booking does not exists in database')
                .uponReceiving('a request to bulk upload bookings')
                .withRequest('POST', '/api/v1/bookings/bulk_upload', {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'

                }, {'bulk_upload_excel_file': Pact.Match.somethingLike('data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,AABB')})

                .willRespondWith(204, {
                    'Content-Type': 'application/json; charset=utf-8'
                }, Pact.Match.somethingLike(new Object({})));

            bookingProvider.run(done, function (runComplete) {

                service.bulkUploadBookings('data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,AABB')
                    .subscribe((res: any) => {
                        service.bookings.push(res.data);
                        expect(res.status).toEqual(204);
                        done();
                    }, err => done.fail(err), () => {
                        runComplete();
                    });
            });
        })();
    });


    it('should invite a bulk of interpreters', function (done) {
        inject([BookingService], (service: BookingService) => {
            let invite_url = 'http://' + GLOBAL.BOOKING_JOB_INVITE + 2 + '/job-detail';
            let obj = {'invite_url': invite_url, 'interpreters': [{'id': 2579}]};

            bookingProvider
                .given('booking does exists in database')
                .uponReceiving('a request to invite interpreters')
                .withRequest('POST', '/api/v1/bookings/2/invite_interpreters', {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'

                    }, Pact.Match.somethingLike(obj)
                ).willRespondWith(204);

            bookingProvider.run(done, function (runComplete) {
                let mocK_invite = [{'id': 2579}];
                service.inviteInterpreters(2, mocK_invite)
                    .subscribe((res: any) => {
                        expect(res.status).toEqual(204);
                        done();
                    }, err => done.fail(err), () => {
                        runComplete();
                    });
            });
        })();
    });
    /*
    it('should unassign a interpreters', function (done) {
        let obj = { };

        inject([BookingService], (service: BookingService) => {
            bookingProvider
                .given('an interpreter is assigned')
                .uponReceiving('a request to unassign interpreter')
                .withRequest('PUT', '/api/v1/bookings/3/interpreter/15/unassign', {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'

                    }, Pact.Match.somethingLike(obj)
                ).willRespondWith(204);

            bookingProvider.run(done, function (runComplete) {
                service.unAssignInterpreter(3, 15)
                    .subscribe((res: any) => {
                        expect(res.status).toEqual(204);
                        done();
                    }, err => done.fail(err), () => {
                        runComplete();
                    });
            });
        })();
    });
*/
    it('should reassign bulk of interpreters', function (done) {
        let invite_url = 'http://' + GLOBAL.BOOKING_JOB_INVITE + 2 + '/job-detail';
        let obj = {'invite_url': invite_url, 'interpreters': [{'id': 2579}]};

        inject([BookingService], (service: BookingService) => {
            bookingProvider
                .given('an interpreter is reassigned')
                .uponReceiving('a request to reassign interpreter')
                .withRequest('PUT', '/api/v1/bookings/3/assign_interpreters', {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'

                    }, Pact.Match.somethingLike(obj)
                ).willRespondWith(204);

            bookingProvider.run(done, function (runComplete) {
                let mocK_invite = [{'id': 2579}];
                service.reAssignInterpreter(3, mocK_invite)
                    .subscribe((res: any) => {
                        expect(res.status).toEqual(204);
                        done();
                    }, err => done.fail(err), () => {
                        runComplete();
                    });
            });
        })();
    });


    describe('Fetch All booking Api', () => {

        it('should return a collection of bookings for fetch all bookings', function (done) {
            inject([BookingService], (service: BookingService) => {
                let int = bookingProvider
                    .given('there are bookings already added inside the database')
                    .uponReceiving('a request to get all bookings')
                    .withRequest({
                            method: 'GET',
                            path: '/api/v1/bookings',
                            headers: {
                                'Accept': 'application/json'
                            }
                        }
                    )
                    .willRespondWith(200, {
                        'Content-Type': 'application/json; charset=utf-8'
                    }, {'bookings': Pact.Match.somethingLike(mock_response_with_interpreters)});

                bookingProvider.run(done, function (runComplete) {
                    service.fetchBookings()
                        .subscribe((res: any) => {
                            expect(res.status).toEqual(200);
                            service.bookings = res.data.bookings;
                            expect(service.bookings.length).toBeGreaterThan(0);
                            done();
                        }, err => done.fail(err), () => {
                            runComplete();
                        });

                });
            })();
        });
    });

    it('should get an individual booking by its *id*', function (done) {
        inject([BookingService], (service: BookingService) => {
            bookingProvider
                .given('booking api should return booking by its id')
                .uponReceiving('a request for single bookings')
                .withRequest({
                        method: 'GET',
                        path: '/api/v1/bookings/1',
                        headers: {
                            'Accept': 'application/json'
                        }
                    }
                )
                .willRespondWith(200, {
                    'Content-Type': 'application/json; charset=utf-8'
                }, Pact.Match.somethingLike(mock_response_with_interpreters[0]));

            bookingProvider.run(done, function (runComplete) {
                service.getBooking(1)
                    .subscribe((res: any) => {
                        let data = res.data;
                        let u = new Booking();
                        u.fromJSON(data);
                        expect(u).toEqual(jasmine.any(Booking));
                        done();
                    }, err => done.fail(err), () => {
                        runComplete();
                    });

            });
        })();
    });

    it('should throw 404 when trying to get booking by its *id*', function (done) {
        inject([BookingService], (service: BookingService) => {
            bookingProvider
                .given('there are no bookings inside the database with that id')
                .uponReceiving('a request to get booking by id')
                .withRequest({
                    method: 'GET',
                    path: '/api/v1/bookings/-1',
                    headers: {
                        'Accept': 'application/json'
                    }
                })
                .willRespondWith(404);

            bookingProvider.run(done, function (runComplete) {
                service.getBooking(-1)
                    .subscribe((res: any) => {
                        done.fail(res);
                    }, err => {
                        expect(err.status).toEqual(404);
                        done();
                    }, () => {
                        runComplete();
                    });
            });
        })();
    });

    it('should update an existing bookings', function (done) {
        inject([BookingService], (service: BookingService) => {
            bookingProvider
                .given('booking exists in database')
                .uponReceiving('a request to update a booking, containing booking object')
                .withRequest('PATCH', '/api/v1/bookings/2', {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    }, Pact.Match.somethingLike({'booking': mock_db[0].toJSON()})
                )
                .willRespondWith(204);

            bookingProvider.run(done, function (runComplete) {
                let u: Booking = mock_db[0];
                u.venue.street_number = 'updated';

                let status_code = service.updateBooking('2', u)
                    .subscribe((res: any) => {
                        expect(res.status).toEqual(204);
                        done();
                    }, err => done.fail(err), () => {
                        runComplete();
                    });

            });
        })();
    });

    it('should delete a booking by its ID', function (done) {
        inject([BookingService], (service: BookingService) => {
            bookingProvider
                .given('booking exists in database')
                .uponReceiving('a request to delete a booking')
                .withRequest('DELETE', '/api/v1/bookings/1', {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'

                })
                .willRespondWith(204);

            bookingProvider.run(done, function (runComplete) {
                service.deleteBooking(1)
                    .subscribe((res: any) => {
                        expect(res.status).toEqual(204);
                        done();
                    }, err => done.fail(err), () => {
                        runComplete();
                    });
            });
        })();
    });

});
