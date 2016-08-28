package _xr
{
   import _D_2.MysteryBoxInfo;
   
   public class _0P_R_
   {
       
      
      private var _1J_a:Object;
      
      private var initialized:Boolean = false;
      
      private var _15N_:Boolean = false;
      
      public function _0P_R_()
      {
         super();
      }
      
      public function _U_A_() : Object
      {
         return this._1J_a;
      }
      
      public function _U_J_(param1:Array) : void
      {
         var _loc2_:MysteryBoxInfo = null;
         this._1J_a = {};
         for each(_loc2_ in param1)
         {
            this._1J_a[_loc2_.id] = _loc2_;
         }
         this.initialized = true;
      }
      
      public function isInitialized() : Boolean
      {
         return this.initialized;
      }
      
      public function setInitialized(param1:Boolean) : void
      {
         this.initialized = param1;
      }
      
      public function get isNew() : Boolean
      {
         return this._15N_;
      }
      
      public function set isNew(param1:Boolean) : void
      {
         this._15N_ = param1;
      }
   }
}
