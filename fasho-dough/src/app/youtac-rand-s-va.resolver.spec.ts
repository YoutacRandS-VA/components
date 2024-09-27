import { TestBed } from '@angular/core/testing';
import { ResolveFn } from '@angular/router';

import { youtacRandSVAResolver } from './youtac-rand-s-va.resolver';

describe('youtacRandSVAResolver', () => {
  const executeResolver: ResolveFn<boolean> = (...resolverParameters) => 
      TestBed.runInInjectionContext(() => youtacRandSVAResolver(...resolverParameters));

  beforeEach(() => {
    TestBed.configureTestingModule({});
  });

  it('should be created', () => {
    expect(executeResolver).toBeTruthy();
  });
});
