import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { Country } from '../country';
import { CountryService } from '../country.service';

@Component({
  selector: 'app-country-details',
  templateUrl: './country-details.component.html',
  styleUrls: ['./country-details.component.css']
})
export class CountryDetailsComponent implements OnInit {

  id: number;
  country: Country;

  constructor(private route: ActivatedRoute,private router: Router,
    private countryService: CountryService) { }

  ngOnInit() {
    this.country = new Country();

    this.id = this.route.snapshot.params['id'];
    
    this.countryService.getCountry(this.id)
      .subscribe(data => {
        this.country = data;
      });
  }

  list(){
    this.router.navigate(['country']);
  }
}
