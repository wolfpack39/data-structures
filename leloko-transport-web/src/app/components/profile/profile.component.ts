import { AfterViewInit, Component } from '@angular/core';
import { SidenavService } from '../sidenavs/sidenav/sidenav.service';
import { SidenavComponent } from "../sidenavs/sidenav/sidenav.component";

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [],
  templateUrl: './profile.component.html',
  styleUrl: './profile.component.scss'
})
export class ProfileComponent implements AfterViewInit {
  constructor(public sidenavService: SidenavService) { }

  ngAfterViewInit(): void {
    this.sidenavService.push(SidenavComponent);
  }
}
