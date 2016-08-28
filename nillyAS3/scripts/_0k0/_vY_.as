package _0k0
{
   import _0eG_._4N_;
   import _0eG_._xn;
   import _0eG_.Description;
   
   public class _vY_ extends _4N_
   {
       
      
      private var _matcher:_xn;
      
      public function _vY_(param1:_xn)
      {
         super();
         this._matcher = param1;
      }
      
      override public function matches(param1:Object) : Boolean
      {
         return !this._matcher.matches(param1);
      }
      
      override public function describeTo(param1:Description) : void
      {
         param1.appendText("not ")._1C_f(this._matcher);
      }
   }
}
