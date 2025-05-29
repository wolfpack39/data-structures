import { Routes } from '@angular/router';

export const routes: Routes = [
    {
        path: 'home',
        loadComponent: () => 
            import('./components/home/home.component').then(
                (c) => c.HomeComponent
            ),
        title: 'Home',
    },
    {
        path: 'settings',
        loadComponent: () => 
            import('./components/settings/settings.component').then(
                (c) => c.SettingsComponent
            ),
        title: 'Profile',
    },
    {
        path: '',
        redirectTo: 'home',
        pathMatch: 'full',
      },
];
