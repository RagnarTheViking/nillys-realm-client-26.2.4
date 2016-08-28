package _1cm
{
   import flash.display.Sprite;
   import _1gF_._I_a;
   import flash.filters.DropShadowFilter;
   import _1xa._dU_;
   import _C_._1O_I_;
   import _1xa.SText;
   
   public class BattleSummaryText extends Sprite
   {
       
      
      private var _1N_S_:_I_a;
      
      private var _1t:_I_a;
      
      private var _0yu:_I_a;
      
      public function BattleSummaryText(param1:String, param2:int, param3:int)
      {
         this._1N_S_ = this._aS_();
         this._1t = this._027();
         this._0yu = this._027();
         super();
         this._1N_S_.setStringBuilder(new _dU_().setParams(param1));
         this._1t.setStringBuilder(new _dU_().setParams(_1O_I_._0W_7,{"waveNumber":param2 - 1}));
         this._0yu.setStringBuilder(new SText(this._E_U_(param3)));
         this.align();
      }
      
      private function align() : void
      {
         this._1N_S_.x = width / 2 - this._1N_S_.width / 2;
         this._1t.y = this._1N_S_.height + 10;
         this._1t.x = width / 2 - this._1t.width / 2;
         this._0yu.y = this._1t.y + this._1t.height + 5;
         this._0yu.x = width / 2 - this._0yu.width / 2;
      }
      
      private function _E_U_(param1:int) : String
      {
         var _loc2_:int = param1 / 60;
         var _loc3_:int = param1 % 60;
         var _loc4_:String = _loc2_ < 10?"0":"";
         _loc4_ = _loc4_ + (_loc2_ + ":");
         _loc4_ = _loc4_ + (_loc3_ < 10?"0":"");
         _loc4_ = _loc4_ + _loc3_;
         return _loc4_;
      }
      
      private function _aS_() : _I_a
      {
         var _loc1_:_I_a = null;
         _loc1_ = new _I_a();
         _loc1_.setSize(16).setBold(true).setColor(16777215);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _027() : _I_a
      {
         var _loc1_:_I_a = new _I_a();
         _loc1_.setSize(14).setBold(true).setColor(11776947);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         addChild(_loc1_);
         return _loc1_;
      }
   }
}
