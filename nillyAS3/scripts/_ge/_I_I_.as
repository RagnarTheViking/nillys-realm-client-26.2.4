package _ge
{
   import flash.utils.Dictionary;
   import _f7.Signal;
   import _S_b._1gV_;
   
   public class _I_I_
   {
      
      public static const _1__7:int = 2594;
      
      public static const _1dk:int = 254;
      
      public static const _11C_:int = 2595;
      
      public static const _08K_:int = 255;
       
      
      public var _0I___:Dictionary;
      
      public var _A_L_:Signal;
      
      public function _I_I_()
      {
         super();
         this._0I___ = new Dictionary();
         this._A_L_ = new Signal(int);
      }
      
      public static function _Y_H_(param1:int) : int
      {
         switch(param1)
         {
            case _1__7:
               return _1dk;
            case _11C_:
               return _08K_;
            default:
               return -1;
         }
      }
      
      public function _0vu(param1:XML) : void
      {
         var _loc2_:int = 0;
         var _loc3_:_1gV_ = null;
         var _loc4_:int = param1.PotionPurchaseCooldown;
         var _loc5_:int = param1.PotionPurchaseCostCooldown;
         var _loc6_:int = param1.MaxStackablePotions;
         var _loc7_:Array = new Array();
         for each(_loc2_ in param1.PotionPurchaseCosts.cost)
         {
            _loc7_.push(_loc2_);
         }
         _loc3_ = new _1gV_();
         _loc3_._0Y_y = _loc4_;
         _loc3_._M_O_ = _loc5_;
         _loc3_._eI_ = _loc6_;
         _loc3_.objectId = _1__7;
         _loc3_.position = 0;
         _loc3_._jD_ = _loc7_;
         this._0I___[_loc3_.position] = _loc3_;
         _loc3_.update.add(this.update);
         _loc3_ = new _1gV_();
         _loc3_._0Y_y = _loc4_;
         _loc3_._M_O_ = _loc5_;
         _loc3_._eI_ = _loc6_;
         _loc3_.objectId = _11C_;
         _loc3_.position = 1;
         _loc3_._jD_ = _loc7_;
         this._0I___[_loc3_.position] = _loc3_;
         _loc3_.update.add(this.update);
      }
      
      public function _3l(param1:uint) : _1gV_
      {
         var _loc2_:* = null;
         for(_loc2_ in this._0I___)
         {
            if(this._0I___[_loc2_].objectId == param1)
            {
               return this._0I___[_loc2_];
            }
         }
         return null;
      }
      
      private function update(param1:int) : void
      {
         this._A_L_.dispatch(param1);
      }
   }
}
