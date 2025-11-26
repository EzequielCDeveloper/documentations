# Angular-Course-Elements

Angular => Plataforma estructural

brindar funcionalidad a algo que no lo tenia => directivas

## Components

=/= Frameworkes => Software Developers

Depende =>

- Recursos
- Limitaciones
- Requisitos

Que es?

- La unidad logica MINIMA => Manejar una cosa por vez
  - Formulario(LOGIN)
    - Renderizar la lista de personajes
      - El personaje
        - borrarlo
          - Editarlo
            - Validar si los datos son correctos
            - Submit
- Tipos de Components
  // Patron contenedor / presentaciona
  // Scream architecture
  // Clean architecture
  // Single Source of Truth architecture
- Presentational: Usado para mostrar datos y manejar la UI
- Container: Maneja la logica de negocios y tambien la comunicacion con entidades externas.

//Modulos
Caja => contiene todo y solamente todo lo que se necesita para una funcionalidad.

```typescript
@Component({
  standalone: true,
  selector: "app-user-container",
  template: `<app-user-container [userName]="userNameSignal()" />`,
  imports: [UserProfileComponent],
})
export class UserContainerComponent {
  userService = injection(UserService);
  userNameSignal = this.userService.userNameSignal;
}
```

```html
<app-user-profile> </app-user-profile>
```

```typescript
@Component({
  standalone: true,
  selector: "app-user-profile",
  template: `<div [style]="{ color: red }">{{ userName }}</div>`,
})
export class UserProfileComponent {
  userName: string = "Ezequiel";
}
```

existen scripts para convertir modulos de angular a standalone\

## directivas

Son aquellas que brindan funcionalidad extra a algo que antes no lo tenia.

- ngClass
- ngStyle
- ngIf
- ngFor

directiva estructural:

```html
<div *ngIf=""></div>
<div *ngFor=""></div>
```

directiva de atributos

<div [style]="{ 'active': isActive }"></div>

Directiva

```typescript
@Directive({
  standalone: true,
  selector: '[appShowOnScreenSize]'
})
export class appShowOnScreenSizeDirective implements OnInit {
  @input() appShowOnScreenSize: 'small' | 'medium' | 'large';

  constructor() {
    private templateRef: TemplateRef<any>
    private viewContainer: viewContainerRef
  } {}

  ngOnInit () {
    this.updateView();
    window.appEventListener('rezise', this.updateView.bind(this))
  }

  private updateView() {
    const width = window.innerWidth;

    this.viewContainer.clear()

    if (this.shouldShowContent(width)) {
      this.viewContainer.createEmbedddedView(this.templateRef)
    }
  }

  private shouldShowContent(width: number): boolean {
    if (this.appShowOnScreenSizeDirective === 'small' && width < 600){
      return true;
    }
  }
  private shouldShowContent(width: number): boolean {
    if (this.appShowOnScreenSizeDirective === 'medium' && width >= 600 && width <= 1024) {
      return true;
    }
  }
  private shouldShowContent(width: number): boolean {
    if (this.appShowOnScreenSizeDirective === 'large' && width > 1024) {
      return true;
    }
  }

  return false;
}
```

```html
<div *appShowOnScreenSize="'small'">Contenido para pantallas pequenas</div>
```

Directiva de atributos

```typescript
@Directive({
  standalone: true,
  select: "[appHighlight]",
})
export class HighlightDirective {
  constructor(
    private el: ElemenRef,
    private renderer: Renderer2,
  ) {}

  @HostListener("mouseenter") onMouseEnter() {
    this.renderer.setStyle(this.el.nativeElement, "background-color", "yellow");
  }

  @HostListener("mouseleave") onMouseLeave() {
    this.renderer.removeStyle(this.el.nativeElement, "background-color");
  }
}
```

```html
<p appHighlight>Pasa este mouse sobre este texto para resaltar su contenido</p>
```

## Services

- Se utiliza para la logica de negocios
- Se utiliza para conectarse con entidadess externas
- Se utiliza para compartir informacion

- SINGLETON => que hay una unica instancia del Services
  - esa instancia se comparte atraves de la app
  - la info que este contiene, se comparte atraves de toda la app

Componente => URL

providedIn: root -> unica instancia TODA la aplicacion

```typescript
@Injectable({
  providedIn: "root",
})
export class AuthServices {
  isAuthenticated: boolean = false;

  changeAuthentication() {
    this.isAuthenticated = true;
  }
  static login() {
    console.log("usuario no authenticated");
  }
}

AuthServices.login();

//Archivo cualquiera

export const login = () => {
  console.log("usuario no loggeado");
};
```

providedIn: 'any' -> se va injectar en el modulo mas cercano al que lo solicite por primera vez

```typescript
@Injectable({
  log(message:string) {
  console.log('log':, message)
  }
})
```

Por component

```typescript
@Component({
  selector: 'app-local',
  template: '<p>contenido del componente local</p>'
  providers: [LocalServices]
})
export class LocalServices {
  localService = inject(localService)
}
```

Poder intercambiar el uso de los providers

```typescript
@Injectable()
export class MockDataServices {
  getData() {
    return 'mock data';
  }
}

@Injectable()
export class RealDataService {
  getData() {
    return 'real DAta';
  }
}

@Component({
  standalone: true,
  selector:'app-root',
  template:  `<p>{{data}}</p>`,
  providers: [
  { provide: MockDataServices, useClass: RealDataService }
  ]
})

@NgModule({
providers: [
  { provide: MockDataService, useClass: RealDataService }
]
})

export class AppComponent {
  data: this.dataService.getData();
  dataServices = inject(MockDataService);
}
```

useValue

```typescript
const CONFIG = { apiURL: "https://api.example.com" };

@Component({
  standalone: true,
  selector: "app-config",
  template: `<p>API URL: {{ config.apiURL }}</p>`,
  providers: [
    { provide: "CONFIG", useValue: { apiUrl: "https://api.example.com" } },
  ],
})
export class ConfigComponent {
  constructor(@Inject("CONFIG") public config: { apiURL: string }) {}
}
```

useFactory

```typescript
@Injectable()
export  class dataServices {
  apiURL: string = '';
}
export function dataServiceFactory(hostname: string) {
  const apiURL = window.location.hostname === 'localhost'
  ? "https://localhost:3000"
  ? "https://rickmorty.com"

  return new dataServices(apiURL)
}


```

useExisting

```typescript
@Injectable()
export class userService {
  getData() {
    return "base data";
  }
}

@Injectable()
export class DerivedService {
  userService = inject(userService);

  getData() {
    return this.userService.getData() + " - derived";
  }
}

@Component({
  standoalone: true,
  selector: "app-route",
  template: `<p>{{ data }}</p>`,
  provider: [
    userService,
    { provide: DerivedService, useExisting: userService },
  ],
})
export class AppComponent {
  DerivedService = inject(DerivedService);
  data = this.DerivedService.getData();
}
```
