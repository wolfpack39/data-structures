import { ChangeDetectorRef, Component, AfterViewInit, OnDestroy } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { SidenavService } from './components/sidenavs/sidenav/sidenav.service';
import { DefaultSidenavComponent } from './components/sidenavs/default-sidenav/default-sidenav.component';
import { SidenavComponent } from "./components/sidenavs/sidenav/sidenav.component";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, SidenavComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent implements AfterViewInit, OnDestroy {
  title = 'leloko-transport-web';

  constructor(
    private sidenavService: SidenavService, 
    private cdr: ChangeDetectorRef
  ) { }

  ngAfterViewInit() {
    this.sidenavService.push(DefaultSidenavComponent);
    this.cdr.detectChanges();
  }

  ngOnDestroy(): void {
    this.sidenavService.pop();
  }
  
}
