import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FashoDoughModuleComponent } from './fasho-dough-module.component';

describe('FashoDoughModuleComponent', () => {
  let component: FashoDoughModuleComponent;
  let fixture: ComponentFixture<FashoDoughModuleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FashoDoughModuleComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FashoDoughModuleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
