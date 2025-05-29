import { Component } from '@angular/core';
import { SidenavLinkComponent } from "../../components/sidenav-link/sidenav-link.component";
import { RouterLink } from '@angular/router';
import { MatIcon } from '@angular/material/icon';

@Component({
  selector: 'app-settings-sidenav',
  standalone: true,
  imports: [SidenavLinkComponent, RouterLink, MatIcon],
  template: `
    <app-sidenav-link
      routerLink="/"
    >
      Add user
    </app-sidenav-link>
    <app-sidenav-link
      routerLink="/"
    >
      Add user
    </app-sidenav-link>
  `,
  styles: `
    :host {
      
    }
  `
})
export class SettingsSidenavComponent {

}
