import { AfterViewInit, Component } from '@angular/core';
import { SidenavLinkComponent } from '../../sidenav-link/sidenav-link.component';
import { SidenavService } from '../sidenav/sidenav.service';
import { SidenavContentAreaDirective } from '../sidenav/sidenav-content-area.directive';

@Component({
  selector: 'app-default-sidenav',
  standalone: true,
  imports: [SidenavLinkComponent],
  templateUrl: './default-sidenav.component.html',
  styleUrl: './default-sidenav.component.scss'
})
export class DefaultSidenavComponent {
}
