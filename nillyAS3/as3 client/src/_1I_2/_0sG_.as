package _1I_2
{
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   
   public class _0sG_
   {
       
      
      private var _O_4:_1I_2._O_g;
      
      public function _0sG_(param1:_1I_2._O_g)
      {
         var _loc2_:_u__ = null;
         super();
         this._O_4 = param1;
         this._O_4.addEventListener(_11M_._0S_k,this._12e);
         this._O_4.addEventListener(_11M_._1G_X_,this._0K_q);
         for each(_loc2_ in this._O_4._0hr)
         {
            this._F_O_(_loc2_.container);
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:_u__ = null;
         this._O_4.removeEventListener(_11M_._0S_k,this._12e);
         this._O_4.removeEventListener(_11M_._1G_X_,this._0K_q);
         for each(_loc1_ in this._O_4._0hr)
         {
            this._02Q_(_loc1_.container);
         }
      }
      
      private function _12e(param1:_11M_) : void
      {
         this._F_O_(param1.container);
      }
      
      private function _0K_q(param1:_11M_) : void
      {
         this._02Q_(param1.container);
      }
      
      private function _F_O_(param1:DisplayObjectContainer) : void
      {
         param1.addEventListener(_J_F_._17x,this._0hY_);
      }
      
      private function _02Q_(param1:DisplayObjectContainer) : void
      {
         param1.removeEventListener(_J_F_._17x,this._0hY_);
      }
      
      private function _0hY_(param1:_J_F_) : void
      {
         var _loc2_:DisplayObject = null;
         param1.stopImmediatePropagation();
         var _loc3_:DisplayObjectContainer = param1.currentTarget as DisplayObjectContainer;
         _loc2_ = param1.target as DisplayObject;
         var _loc4_:Class = _loc2_["constructor"];
         this._O_4._1W_3(_loc3_)._N_m(_loc2_,_loc4_);
      }
   }
}
