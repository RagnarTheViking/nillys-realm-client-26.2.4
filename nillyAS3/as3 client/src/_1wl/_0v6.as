package _1wl
{
   import flash.utils.Dictionary;
   
   public class _0v6
   {
       
      
      private var _oV_;
      
      private var _1N_n:Boolean;
      
      public function _0v6(param1:*, param2:Boolean = false)
      {
         super();
         this._1N_n = param2;
         this._1G_a = param1;
      }
      
      public function get _1G_a() : *
      {
         var _loc1_:* = undefined;
         if(this._1N_n)
         {
            return this._oV_;
         }
         for(_loc1_ in this._oV_)
         {
            return _loc1_;
         }
         return null;
      }
      
      public function set _1G_a(param1:*) : void
      {
         if(this._1N_n)
         {
            this._oV_ = param1;
         }
         else
         {
            this._oV_ = new Dictionary(true);
            this._oV_[param1] = null;
         }
      }
      
      public function get strong() : Boolean
      {
         return this._1N_n;
      }
   }
}
