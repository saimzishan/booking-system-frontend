import {Http} from '@angular/http';
import {Injectable} from '@angular/core';
import {ROLE} from '../model/role.enum';
import {GLOBAL} from '../global';
import {HyphenPipe} from '../pipe/hyphen.pipe';
import {User} from '../model/user.entity';

@Injectable()
export class RolePermission {
    permissions;
    defaultData = /**
     * This should be removed , and loaded from json file
     */`{
    "default-route": "booking-management",
    "booking-officer":{
    "not-allowed-routes": [
    ],
        "routes-with-data-permissions": {
            "user-management": {
                "administrator": "no-access"
            }
        }
    },
     "accountant":{
      "not-allowed-routes": [
    "block_out"
    ],
        "routes-with-data-permissions": {
            "user-management": {
                "administrator": "no-access",
                "booking-officer": "no-access",
                "interpreter": "no-access",
                "organizational-representitive": "no-access"
            }
        }
    },
    "interpreter": {
        "not-allowed-routes": [
            "user-management",
            "booking-job", "create-booking"
        ],
        "routes-with-data-permissions": {
            "booking-management": {
                "administrator": "no-access",
                "booking-officer": "no-access",
                "accountant": "no-access",
                "organizational-representitive": "no-access"
            }
        }
    },
    "organisational-representative": {
        "not-allowed-routes": [
            "block_out",
            "booking-job"
        ],
        "routes-with-data-permissions": {
            "booking-management": {
                "administrator": "no-access",
                "booking-officer": "no-access",
                "interpreter": "no-access"
            },
             "user-management": {
                "administrator": "no-access",
                "booking-officer": "no-access",
                "interpreter": "no-access"

            }
        }
    },
    "individual-client": {
        "not-allowed-routes": [
            "user-management",
            "booking-job", "block_out"
        ],
        "routes-with-data-permissions": {
            "booking-management": {
                "administrator": "no-access",
                "booking-officer": "no-access",
                "interpreter": "no-access",
                "organizational-representitive": "no-access"
            }
        }
    },
    "administrator": {
       "not-allowed-routes": [
        ]
    }
}`;

    curr_role = '';
    hyphen_pipe = new HyphenPipe();

    constructor(private http: Http) {
        this.loadDefaultData();
    }

    private refreshUserDetail() {
        let curr_role: ROLE = ROLE.NONE;
        let u: User = GLOBAL.currentUser;
        curr_role = u.getRole();
        this.curr_role = this.hyphen_pipe.transform(ROLE[curr_role]);
    }

    loadData() {
        let o = this.http.get('./role-permission.json')
            .subscribe((res) => {
                this.permissions = res.json();
                o.unsubscribe();
            });
    }

    loadDefaultData() {
        this.permissions = JSON.parse(this.defaultData);
    }

    getDefaultRouteForCurrentUser() {
        this.refreshUserDetail();

        return Boolean(this.permissions[this.curr_role] && this.permissions[this.curr_role]['default-route']) ?
            this.permissions[this.curr_role]['default-route']
            : this.permissions['default-route'];
    }

    isRestrictedRouteForCurrentUser(path: string): Boolean {
        this.refreshUserDetail();
        path = path.startsWith('/') ? path : '/' + path;
        let p = path.startsWith('/') ? path.split('/') : [path];
        let lastPath = p.length > 0 ? p[p.length - 1] : '';
        let res: Boolean = Boolean(this.permissions[this.curr_role] && this.permissions[this.curr_role]['not-allowed-routes']);
        if (res) { // Some Typescript issue
            for (let x of this.permissions[this.curr_role]['not-allowed-routes']) {
                if (lastPath.startsWith(x)) {
                    return true;
                }
            }
        }
        return false; // cannot return res, !(
    }

    isDataReadOnlyForCurrentUser(path: any, data_owner: any) {
        this.refreshUserDetail();
        data_owner = this.hyphen_pipe.transform(data_owner);
        return Boolean(this.permissions[this.curr_role] && this.permissions[this.curr_role]['routes-with-data-permissions']
            && this.permissions[this.curr_role]['routes-with-data-permissions'][path] &&
            this.permissions[this.curr_role]['routes-with-data-permissions'][path][data_owner] &&
            this.permissions[this.curr_role]['routes-with-data-permissions'][path][data_owner] === 'read');
    }

    isDataRestrictedForCurrentUser(path: any, data_owner: any) {
        this.refreshUserDetail();
        data_owner = this.hyphen_pipe.transform(data_owner);
        return Boolean(this.permissions[this.curr_role] && this.permissions[this.curr_role]['routes-with-data-permissions']
            && this.permissions[this.curr_role]['routes-with-data-permissions'][path] &&
            this.permissions[this.curr_role]['routes-with-data-permissions'][path][data_owner] &&
            this.permissions[this.curr_role]['routes-with-data-permissions'][path][data_owner] === 'no-access');
    }

    getDefaultRoute(role: any) {
        let r = this.permissions[this.hyphen_pipe.transform(role)];
        return Boolean(r && r['default-route']) ?
            r['default-route']
            : this.permissions['default-route'];
    }

    isRestrictedRoute(role: any, path: any) {
        let r = this.permissions[this.hyphen_pipe.transform(role)];

        path = path.startsWith('/') ? path : '/' + path;
        let p = path.startsWith('/') ? path.split('/') : [path];
        let lastPath = p.length > 0 ? p[p.length - 1] : '';
        let res: Boolean = Boolean(r && r['not-allowed-routes']);
        if (res) { // Some Typescript issue
            for (let x of r['not-allowed-routes']) {
                if (lastPath.startsWith(x)) {
                    return true;
                }
            }
        }
        return false; // cannot return res, !(
    }

    isDataReadOnly(role: any, path: any, data_owner: any) {
        let r = this.permissions[this.hyphen_pipe.transform(role)];
        data_owner = this.hyphen_pipe.transform(data_owner);
        return Boolean(r && r['routes-with-data-permissions']
            && r['routes-with-data-permissions'][path] &&
            r['routes-with-data-permissions'][path][data_owner] &&
            r['routes-with-data-permissions'][path][data_owner] === 'read');
    }

    isDataRestricted(role: any, path: any, data_owner: any) {
        let r = this.permissions[this.hyphen_pipe.transform(role)];
        data_owner = this.hyphen_pipe.transform(data_owner);
        return Boolean(r && r['routes-with-data-permissions']
            && r['routes-with-data-permissions'][path] &&
            r['routes-with-data-permissions'][path][data_owner] &&
            r['routes-with-data-permissions'][path][data_owner] === 'no-access');
    }
}
