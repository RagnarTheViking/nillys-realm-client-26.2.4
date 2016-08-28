package _1I_2
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.display.DisplayObject;
   import flash.utils.getQualifiedClassName;
   
   public class _14V_
   {
       
      
      private const _filter:RegExp = /^mx\.|^spark\.|^flash\./;
      
      private var _O_4:_1I_2._O_g;
      
      public function _14V_(param1:_1I_2._O_g)
      {
         var _loc2_:_u__ = null;
         super();
         this._O_4 = param1;
         this._O_4.addEventListener(_11M_._cz,this._1ly);
         this._O_4.addEventListener(_11M_._0nx,this._1X_5);
         for each(_loc2_ in this._O_4._0L_u)
         {
            this._1E_U_(_loc2_.container);
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:_u__ = null;
         this._O_4.removeEventListener(_11M_._cz,this._1ly);
         this._O_4.removeEventListener(_11M_._0nx,this._1X_5);
         for each(_loc1_ in this._O_4._0L_u)
         {
            this._19v(_loc1_.container);
         }
      }
      
      private function _1ly(param1:_11M_) : void
      {
         this._1E_U_(param1.container);
      }
      
      private function _1X_5(param1:_11M_) : void
      {
         this._19v(param1.container);
      }
      
      private function _1E_U_(param1:DisplayObjectContainer) : void
      {
         param1.addEventListener(Event.ADDED_TO_STAGE,this._0em,true);
         param1.addEventListener(Event.ADDED_TO_STAGE,this._1C_x);
      }
      
      private function _19v(param1:DisplayObjectContainer) : void
      {
         param1.removeEventListener(Event.ADDED_TO_STAGE,this._0em,true);
         param1.removeEventListener(Event.ADDED_TO_STAGE,this._1C_x);
      }
      
      private function _0em(param1:Event) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:String = null;
         _loc2_ = param1.target as DisplayObject;
         _loc3_ = getQualifiedClassName(_loc2_);
         var _loc4_:Boolean = this._filter.test(_loc3_);
         if(_loc4_)
         {
            return;
         }
         var _loc5_:Class = _loc2_["constructor"];
         var _loc6_:_u__ = this._O_4._0E_G_(_loc2_);
         while(_loc6_)
         {
            _loc6_._N_m(_loc2_,_loc5_);
            _loc6_ = _loc6_.parent;
         }
      }
      
      private function _1C_x(param1:Event) : void
      {
         var _loc2_:DisplayObjectContainer = null;
         _loc2_ = param1.target as DisplayObjectContainer;
         _loc2_.removeEventListener(Event.ADDED_TO_STAGE,this._1C_x);
         var _loc3_:Class = _loc2_["constructor"];
         var _loc4_:_u__ = this._O_4._1W_3(_loc2_);
         _loc4_._N_m(_loc2_,_loc3_);
      }
   }
}
