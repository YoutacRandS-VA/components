import { ComponentFixture, TestBed } from '@angular/core/testing';

import { YoutacRandSVAFashoDoughComponent } from './youtac-rand-s-va-fasho-dough.component';

describe('YoutacRandSVAFashoDoughComponent', () => {
  let component: YoutacRandSVAFashoDoughComponent;
  let fixture: ComponentFixture<YoutacRandSVAFashoDoughComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [YoutacRandSVAFashoDoughComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(YoutacRandSVAFashoDoughComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
