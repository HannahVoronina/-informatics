unit srtucture;  //зарезервированное имя модуля(заголовок) ,сохраняется в .pas



interface //в этой части модуля содержатся объявления всех глобальных объектов

         //при объявлении глоб.подпрограмм указывается только заголовок
function ABCD (a,b: Complex) : Complex;
function DCBA (c,d: Complex) : Complex;
uses Cmplx;           //тип Complex и две процедуры:ABCD, DCBA из модуля Cmplx

implementation //исполянемая часть
               //содержит описание подпрограмм, объявленных в интерфейсной части
 function ABCD (a,b: Complex) : Complex;

 begin

 end;

 function DCBA (c,d: Complex) : Complex;

 begin

 end;

end.

