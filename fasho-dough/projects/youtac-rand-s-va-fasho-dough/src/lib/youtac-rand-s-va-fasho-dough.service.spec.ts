import { TestBed } from '@angular/core/testing';

import { YoutacRandSVAFashoDoughService } from './youtac-rand-s-va-fasho-dough.service';

describe('YoutacRandSVAFashoDoughService', () => {
  let service: YoutacRandSVAFashoDoughService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(YoutacRandSVAFashoDoughService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
