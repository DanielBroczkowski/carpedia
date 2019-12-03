import { SimplyCar } from '../simplycar';
import { Component, OnInit, Input } from '@angular/core';
import { SimplyCarService } from '../simplycar.service';
import { SimplyCarListComponent } from '../simplycar-list/simplycar-list.component';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-simplycar-details',
  templateUrl: './simplycar-details.component.html',
  styleUrls: ['./simplycar-details.component.css']
})
export class SimplyCarDetailsComponent implements OnInit {

  id: number;
  simplycar: SimplyCar;

  constructor(private route: ActivatedRoute,private router: Router,
    private simplycarService: SimplyCarService) { }

  ngOnInit() {
    this.simplycar = new SimplyCar();

    this.id = this.route.snapshot.params['id'];
    
    this.simplycarService.getSimplyCar(this.id)
      .subscribe(data => {
        console.log(data)
        this.simplycar = data;
      }, error => console.log(error));
  }

  list(){
    this.router.navigate(['simplycar']);
  }
}