import { HttpInterceptorFn } from '@angular/common/http';

export const youtacRandSVAInterceptor: HttpInterceptorFn = (req, next) => {
  return next(req);
};
