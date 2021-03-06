import { Component, OnInit } from "@angular/core";
import { Router } from "@angular/router";
import { MatTableDataSource } from "@angular/material";
import { FormControl, FormGroup, Validators } from "@angular/forms";
import { CompanyService } from "../company.service";
import { Company } from "../company";
import { CountryService } from "../../country/country.service";
import { Country } from "../../country/country";

@Component({
  selector: "app-company-create",
  templateUrl: "./company-create.component.html",
  styleUrls: ["./company-create.component.css"]
})
export class CompanyCreateComponent implements OnInit {
  company: Company = new Company();
  countries: MatTableDataSource<Country>;

  submitted = false;
  error = false;

  constructor(
    private companyService: CompanyService,
    private router: Router,
    private countryService: CountryService
  ) {}

  ngOnInit() {
    this.getCountries();
  }

  newCompany(): void {
    this.submitted = false;
    this.company = new Company();
  }

  getCountries() {
    this.countryService.getCountryList().subscribe(data => {
      this.countries = data;
      return data;
    });
  }

  save() {
    this.companyService.createCompany(this.company).subscribe();
    this.company = new Company();
  }

  form = new FormGroup({
    name: new FormControl('',[Validators.required,Validators.pattern("[a-zA-Z0-9 ].{0,30}$")]),
    foundation: new FormControl('',[Validators.required,Validators.pattern("[1-2][0-9][0-9][0-9]$")]),
    country: new FormControl('',[Validators.required]),
  });

  validError = (controlName: string, errorName: string) => {
    return this.form.controls[controlName].hasError(errorName);
  }

  onSubmit() {
    if(this.form.invalid){
      this.error = true;
      return;
    }
    else{
      this.error = false;
      this.submitted = true;
      this.save();   
    }
  }

}
