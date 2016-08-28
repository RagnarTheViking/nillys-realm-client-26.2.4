package _0k0
{
   import _0eG_._xn;
   import _0wG_.equalTo;
   
   public function not(param1:Object) : _xn
   {
      if(param1 is _xn)
      {
         return new _vY_(param1 as _xn);
      }
      return not(equalTo(param1));
   }
}
