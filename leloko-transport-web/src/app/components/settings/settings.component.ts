import { AfterViewInit, Component } from '@angular/core';
import { SidenavService } from '../sidenavs/sidenav/sidenav.service';
import { SettingsSidenavComponent } from '../../sidenavs/settings-sidenav/settings-sidenav.component';

@Component({
  selector: 'app-settings',
  standalone: true,
  imports: [],
  template: `
    <p>Main content</p>
    
  `,
  styles: `
    :host {
      
    }
  `,
})
export class SettingsComponent implements AfterViewInit {
  constructor(public sidenavService: SidenavService) {}

  ngAfterViewInit(): void {
    this.sidenavService.push(SettingsSidenavComponent);
  }

  ngOnDestroy(): void {
    this.sidenavService.pop();
  }
}
