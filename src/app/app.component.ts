import { Component, OnDestroy, AfterViewChecked } from '@angular/core';
import { Title } from '@angular/platform-browser';
import {GLOBAL} from './shared/global';
import {AuthGuard} from './auth/auth.guard';
import { SpinnerService } from './spinner/spinner.service';

declare var $: any;


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent  implements OnDestroy, AfterViewChecked {
  public isRequesting = false;
  private sub: any;

  public constructor(public spinnerService: SpinnerService,
    public titleService: Title ) {
    this.titleService.setTitle(GLOBAL.TITLE + GLOBAL.VERSION);
    this.sub = this.spinnerService.requestInProcess$.subscribe(
      isDone => {
        this.isRequesting = isDone;
      });
  }


  ngAfterViewChecked() {
  }

  isLoggedIn() {
    return AuthGuard.isLoggedIn();
  }

  showProgress(val: boolean) {
    this.isRequesting = val;
  }

  ngOnDestroy() {
    this.sub.unsubscribe();
  }
}
